import 'package:flutter/material.dart';
import '../models/companion.dart';
import 'package:camera/camera.dart';
import 'video_chat_page.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../services/friends_service.dart';
import '../models/friend.dart';
import 'companion_profile_page.dart';

class ChatPage extends StatefulWidget {
  final Companion companion;

  const ChatPage({
    super.key,
    required this.companion,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class ChatMessage {
  final String? message;
  final bool isFromUser;
  final File? imageFile;
  final DateTime timestamp;

  ChatMessage({
    this.message,
    required this.isFromUser,
    this.imageFile,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  final Set<String> _usedInsights = {};
  final ImagePicker _picker = ImagePicker();
  bool _isFriend = false;

  @override
  void initState() {
    super.initState();
    _checkFriendStatus();
    // Changed greeting to English
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String greeting = "Hello! ${widget.companion.skillDescription}";
      _addCompanionMessage(greeting);
    });
  }

  // Add companion message helper
  void _addCompanionMessage(String message) {
    setState(() {
      _messages.add(
        ChatMessage(
          message: message,
          isFromUser: false,
        ),
      );
    });
    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }

  // Get random unused insight
  String? _getRandomUnusedInsight() {
    List<String> allInsights = [];
    for (var skill in widget.companion.skills) {
      allInsights.addAll(skill.insights);
    }

    // Filter out used insights
    List<String> unusedInsights = allInsights
        .where((insight) => !_usedInsights.contains(insight))
        .toList();

    if (unusedInsights.isEmpty) {
      return null;
    }

    final random = Random();
    String selectedInsight =
        unusedInsights[random.nextInt(unusedInsights.length)];
    _usedInsights.add(selectedInsight);
    return selectedInsight;
  }

  // 获取相关技能的回复
  String _getSkillBasedResponse(String userMessage) {
    // 将用户消息转换为小写以便匹配
    String messageLower = userMessage.toLowerCase();

    // 遍历所有技能
    for (var skill in widget.companion.skills) {
      // 检查消息是否包含技能相关的关键词
      if (messageLower.contains(skill.name.toLowerCase())) {
        // 从该技能的见解中随机选择一个未使用的
        List<String> unusedInsights = skill.insights
            .where((insight) => !_usedInsights.contains(insight))
            .toList();

        if (unusedInsights.isNotEmpty) {
          final random = Random();
          String selectedInsight =
              unusedInsights[random.nextInt(unusedInsights.length)];
          _usedInsights.add(selectedInsight);
          return selectedInsight;
        }
      }
    }

    // 如果没有找到相关技能的回复，随机选择一个未使用的见解
    return _getRandomUnusedInsight() ??
        "Let's continue discussing more interesting topics!";
  }

  // 更新发送消息的处理方法
  void _handleSendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = _messageController.text;

    setState(() {
      _messages.add(
        ChatMessage(
          message: userMessage,
          isFromUser: true,
        ),
      );
    });
    _messageController.clear();
    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);

    // 添加好友回复
    Future.delayed(const Duration(milliseconds: 500), () {
      String response = _getSkillBasedResponse(userMessage);
      _addCompanionMessage(response);
    });
  }

  void _navigateToVideoChat() async {
    print('Video chat button pressed');
    try {
      final cameras = await availableCameras();
      if (!mounted) return;

      if (cameras.isEmpty) {
        throw Exception('No cameras available on this device');
      }

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoChatPage(
            companion: widget.companion,
            camera: frontCamera,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'This feature may not work in the simulator. Please test on a real device. Error: ${e.toString()}'),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 5),
        ),
      );

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoChatPage(
            companion: widget.companion,
            camera: CameraDescription(
              name: 'dummy',
              lensDirection: CameraLensDirection.front,
              sensorOrientation: 0,
            ),
          ),
        ),
      );
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _messages.add(
            ChatMessage(
              isFromUser: true,
              imageFile: File(image.path),
            ),
          );
        });
        Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);

        // 添加更智能的图片回复
        Future.delayed(const Duration(milliseconds: 500), () {
          String response;
          switch (widget.companion.characterType) {
            case 'Creative Expert':
              response =
                  _getRandomUnusedInsight() ?? "这张图片很有创意！要不要听听我对艺术创作的一些见解？";
              break;
            case 'Tech Expert':
              response =
                  _getRandomUnusedInsight() ?? "这是个不错的图片！我可以跟你分享一些关于图像处理的知识。";
              break;
            case 'Lifestyle Expert':
              response =
                  _getRandomUnusedInsight() ?? "真是一张充满生活气息的照片！让我分享一些相关的经验吧。";
              break;
            default:
              response = _getRandomUnusedInsight() ?? "谢谢你分享这张照片！";
          }
          _addCompanionMessage(response);
        });
      }
    } catch (e) {
      if (!mounted) return;
      print('Image picker error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('选择图片时出错: ${e.toString()}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> _checkFriendStatus() async {
    final isFriend = await FriendsService.isFriend(widget.companion.id);
    setState(() {
      _isFriend = isFriend;
    });
  }

  Future<void> _addFriend() async {
    if (!_isFriend) {
      final success = await FriendsService.addFriend(Friend(
        id: widget.companion.id,
        name: widget.companion.name,
        avatarAsset: widget.companion.avatarAsset,
      ));

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Friend added successfully!')),
        );
        setState(() {
          _isFriend = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Already friends')),
        );
      }
    }
  }

  bool _shouldShowTimestamp(DateTime previousTime, DateTime currentTime) {
    // Show timestamp if messages are more than 5 minutes apart
    return currentTime.difference(previousTime).inMinutes >= 5;
  }

  // 添加自动滚动方法
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompanionProfilePage(
          companion: widget.companion,
          fromChat: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.pop(context),
            color: Colors.black87,
          ),
          title: Row(
            children: [
              GestureDetector(
                onTap: _navigateToProfile,
                child: Hero(
                  tag: 'companion_avatar_${widget.companion.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.companion.avatarAsset,
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.companion.name,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _isFriend
                        ? Colors.grey[200]
                        : Theme.of(context).primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: _isFriend
                            ? Colors.grey[600]
                            : Theme.of(context).primaryColor,
                        size: 24,
                      ),
                      if (_isFriend)
                        Positioned(
                          right: -4,
                          bottom: -4,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                onPressed: _isFriend ? null : _addFriend,
                tooltip: _isFriend ? '已添加' : '添加好友',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.videocam_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ),
                onPressed: _navigateToVideoChat,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            // 聊天背景
            Positioned.fill(
              child: CustomPaint(
                painter: ChatBackgroundPainter(),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final showTimestamp = index == 0 ||
                          _shouldShowTimestamp(_messages[index - 1].timestamp,
                              message.timestamp);
                      return Column(
                        children: [
                          if (showTimestamp)
                            _TimestampWidget(timestamp: message.timestamp),
                          _ChatBubble(
                            message: message,
                            companion: widget.companion,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                _buildInputArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 新增：输入区域组件
  Widget _buildInputArea() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        child: Row(
          children: [
            _buildInputButton(
              icon: Icons.photo_library,
              onPressed: _pickImage,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        maxLines: null,
                        maxLength: 300,
                        buildCounter: (BuildContext context,
                            {required int currentLength,
                            required bool isFocused,
                            required int? maxLength}) {
                          return null; // 返回 null 来隐藏计数器
                        },
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    _buildInputButton(
                      icon: Icons.send_rounded,
                      onPressed: _handleSendMessage,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 新增：输入按钮组件
  Widget _buildInputButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: (color ?? Colors.grey[600])!.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color ?? Colors.grey[600]),
        onPressed: onPressed,
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final Companion companion;

  const _ChatBubble({
    required this.message,
    required this.companion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isFromUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isFromUser) ...[
            _buildAvatar(context),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.65,
              ),
              decoration: BoxDecoration(
                color: message.isFromUser
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(message.isFromUser ? 20 : 5),
                  bottomRight: Radius.circular(message.isFromUser ? 5 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: _buildMessageContent(context),
            ),
          ),
          if (message.isFromUser) ...[
            const SizedBox(width: 8),
            _buildAvatar(context),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return GestureDetector(
      onTap: message.isFromUser
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanionProfilePage(
                    companion: companion,
                  ),
                ),
              );
            },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: message.isFromUser ? Colors.grey[300] : Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: message.isFromUser
              ? Icon(
                  Icons.person,
                  color: Colors.grey[600],
                  size: 20,
                )
              : Image.asset(
                  companion.avatarAsset,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    if (message.imageFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          message.imageFile!,
          fit: BoxFit.cover,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        message.message ?? "",
        style: TextStyle(
          color: message.isFromUser ? Colors.white : Colors.black87,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _TimestampWidget extends StatelessWidget {
  final DateTime timestamp;

  const _TimestampWidget({required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            _formatTimestamp(timestamp),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inSeconds < 60) {
      return 'Just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else if (diff.inDays < 30) {
      return '${diff.inDays ~/ 7}w ago';
    } else if (diff.inDays < 365) {
      return '${diff.inDays ~/ 30}mo ago';
    } else {
      return '${diff.inDays ~/ 365}y ago';
    }
  }
}

class ChatBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.1,
        size.width,
        size.height * 0.3,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
