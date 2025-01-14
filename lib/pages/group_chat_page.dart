import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:math';
import 'dart:io';
import '../data/sample_characters.dart';
import '../models/companion.dart';
import 'package:image_picker/image_picker.dart';

class GroupChatPage extends StatefulWidget {
  final String expertType;

  const GroupChatPage({
    super.key,
    required this.expertType,
  });

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final List<ChatMessage> _messages = [];
  late List<Companion> _experts;
  Timer? _messageTimer;
  final Random _random = Random();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  bool _isTyping = false;
  Companion? _lastSender;

  // 添加最大消息数量限制
  static const int _maxMessages = 50;

  // 添加新的状态变量
  bool _autoScrollEnabled = true;
  int _unreadMessages = 0;
  bool _userScrolling = false;
  double? _userReadingPosition;
  final Map<int, GlobalKey> _messageKeys = {};
  double? _fixedMessageTop;
  int? _fixedMessageIndex;
  final Set<String> _blockedExperts = {};

  @override
  void initState() {
    super.initState();
    _experts = sampleCharacters
        .where((character) => character.characterType == widget.expertType)
        .toList();

    // 添加滚动监听
    _scrollController.addListener(_scrollListener);
    _startMessageTimer();
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.userScrollDirection !=
        ScrollDirection.idle) {
      setState(() {
        _userScrolling = true;
        _autoScrollEnabled = false;
        // 清除固定消息
        _fixedMessageTop = null;
        _fixedMessageIndex = null;
      });
    }
  }

  void _startMessageTimer() {
    void scheduleNextMessage() async {
      // 计算下一条消息的延迟时间：20-40秒
      final delay = _random.nextInt(21) + 20; // 20-40 秒

      // 等待延迟时间
      await Future.delayed(Duration(seconds: delay));

      if (!mounted) return;

      final double? currentPosition = _userReadingPosition;

      // Filter out blocked experts
      final availableExperts = _experts
          .where((e) => e != _lastSender && !_blockedExperts.contains(e.id))
          .toList();
      if (availableExperts.isEmpty) return;

      final expert = availableExperts[_random.nextInt(availableExperts.length)];
      final skill = expert.skills[_random.nextInt(expert.skills.length)];
      final insight = skill.insights[_random.nextInt(skill.insights.length)];

      setState(() {
        _messages.add(
          ChatMessage(
            sender: expert,
            message: insight,
            timestamp: DateTime.now(),
          ),
        );

        if (_messages.length > _maxMessages) {
          _messages.removeAt(0);
        }

        _lastSender = expert;

        if (_autoScrollEnabled) {
          Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
        } else {
          _unreadMessages++;
          if (currentPosition != null && _scrollController.hasClients) {
            _scrollController.jumpTo(currentPosition);
          }
        }
      });

      // 安排下一条消息
      scheduleNextMessage();
    }

    // 开始第一条消息的计时
    scheduleNextMessage();
  }

  // 修改滚动方法
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController
          .animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      )
          .then((_) {
        setState(() {
          _unreadMessages = 0;
          _autoScrollEnabled = true;
          _userReadingPosition = null;
        });
      });
    }
  }

  // 添加新方法：固定消息位置
  void _fixMessagePosition(int index) {
    if (_messageKeys[index]?.currentContext == null) return;

    final RenderBox renderBox =
        _messageKeys[index]!.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    setState(() {
      _fixedMessageTop = position.dy;
      _fixedMessageIndex = index;
      _autoScrollEnabled = false;
    });
  }

  void _handleMessageLongPress(BuildContext context, ChatMessage message) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.block, color: Colors.red),
              title: const Text('Block User'),
              onTap: () {
                setState(() {
                  _blockedExperts.add(message.sender.id);
                  // Remove all messages from the blocked expert
                  _messages
                      .removeWhere((m) => m.sender.id == message.sender.id);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${message.sender.name} has been blocked'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag, color: Colors.orange),
              title: const Text('Report User'),
              onTap: () {
                setState(() {
                  _blockedExperts.add(message.sender.id);
                  // Remove all messages from the reported expert
                  _messages
                      .removeWhere((m) => m.sender.id == message.sender.id);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '${message.sender.name} has been reported and blocked'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _messageTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 点击空白区域收起键盘
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _buildExpertHeader(context),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: _messages.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final message = _messages[index];
                            final messageKey =
                                (_messageKeys[index] ??= GlobalKey());

                            if (index != _fixedMessageIndex) {
                              return GestureDetector(
                                key: messageKey,
                                onLongPress: () {
                                  if (!message.isUserMessage) {
                                    _handleMessageLongPress(context, message);
                                  }
                                },
                                child: AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: _buildMessageBubble(message),
                                ),
                              );
                            }
                            return const SizedBox(height: 80);
                          },
                        ),
                        // 显示固定的消息
                        if (_fixedMessageIndex != null &&
                            _fixedMessageTop != null)
                          Positioned(
                            top: _fixedMessageTop,
                            left: 16,
                            right: 16,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _fixedMessageIndex = null;
                                  _fixedMessageTop = null;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: _buildMessageBubble(
                                  _messages[_messages.length -
                                      1 -
                                      _fixedMessageIndex!],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  _buildMessageComposer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpertHeader(BuildContext context) {
    final expert = _experts.first; // 获取当前专家类型的第一个专家
    Color cardColor;
    IconData cardIcon;

    // 根据专家类型设置颜色和图标
    switch (widget.expertType) {
      case 'Creative Expert':
        cardColor = const Color(0xFF7CB342);
        cardIcon = Icons.palette;
        break;
      case 'Tech Expert':
        cardColor = const Color(0xFF5C6BC0);
        cardIcon = Icons.code;
        break;
      case 'Lifestyle Expert':
        cardColor = const Color(0xFFEF9A9A);
        cardIcon = Icons.spa;
        break;
      case 'Efficiency Expert':
        cardColor = const Color(0xFFFFB74D);
        cardIcon = Icons.speed;
        break;
      default:
        cardColor = Theme.of(context).primaryColor;
        cardIcon = Icons.group;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: cardColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  cardIcon,
                  color: cardColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.expertType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${_experts.length} experts available',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Tooltip(
                message: 'Long press on any message to block or report a user',
                preferBelow: false,
                child: IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('How to Block or Report'),
                        content: const Text(
                          'To block or report a user:\n\n'
                          '1. Long press on any message from that user\n'
                          '2. Select "Block User" or "Report User" from the menu\n\n'
                          'Blocked users will no longer appear in the chat.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Got it'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ..._experts.take(4).map((expert) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 16,
                        child: ClipOval(
                          child: Image.asset(
                            expert.avatarAsset,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0, -0.5),
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                    )),
                if (_experts.length > 4)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '+${_experts.length - 4}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _messages.add(
            ChatMessage(
              message: null,
              sender: _experts.first,
              timestamp: DateTime.now(),
              imageFile: File(image.path),
              isUserMessage: true,
            ),
          );
        });

        if (_autoScrollEnabled) {
          Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
        } else {
          _unreadMessages++;
        }
      }
    } catch (e) {
      if (!mounted) return;
      print('Image picker error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting image: ${e.toString()}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Widget _buildMessageComposer() {
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
                        controller: _textController,
                        onChanged: (text) {
                          setState(() => _isTyping = text.isNotEmpty);
                        },
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
                          return null;
                        },
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    _buildInputButton(
                      icon: Icons.send_rounded,
                      onPressed: _isTyping
                          ? () {
                              if (_textController.text.trim().isNotEmpty) {
                                setState(() {
                                  _messages.add(
                                    ChatMessage(
                                      message: _textController.text,
                                      sender: _experts.first,
                                      timestamp: DateTime.now(),
                                      isUserMessage: true,
                                    ),
                                  );
                                  _textController.clear();
                                  _isTyping = false;
                                });
                              }
                            }
                          : null,
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

  Widget _buildInputButton({
    required IconData icon,
    required VoidCallback? onPressed,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: (color ?? Colors.grey[600])!.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon,
            color: onPressed == null
                ? Colors.grey[400]
                : (color ?? Colors.grey[600])),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final int messageIndex = _messages.indexOf(message);
    final bool isFirstMessage = messageIndex == 0;
    final bool isLastMessage = messageIndex == _messages.length - 1;
    final bool showSenderInfo = isFirstMessage ||
        (messageIndex > 0 &&
            _messages[messageIndex - 1].sender != message.sender);
    final bool isFixed =
        _fixedMessageIndex != null && _messages[_fixedMessageIndex!] == message;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: isFixed
            ? BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(18),
              )
            : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: message.isUserMessage
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!message.isUserMessage) ...[
              if (showSenderInfo)
                CircleAvatar(
                  radius: 16,
                  child: ClipOval(
                    child: Image.asset(
                      message.sender.avatarAsset,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.5),
                      height: 32,
                      width: 32,
                    ),
                  ),
                )
              else
                const SizedBox(width: 32),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: message.isUserMessage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (!message.isUserMessage && showSenderInfo)
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        message.sender.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: message.sender.themeColor,
                        ),
                      ),
                    ),
                  Container(
                    padding: message.imageFile != null
                        ? EdgeInsets.zero
                        : const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: message.isUserMessage
                          ? Theme.of(context).primaryColor
                          : message.sender.themeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: message.imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.file(
                              message.imageFile!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.message!,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: message.isUserMessage
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _formatTimestamp(message.timestamp),
                                style: TextStyle(
                                  color: message.isUserMessage
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.black.withOpacity(0.6),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            if (message.isUserMessage) ...[
              const SizedBox(width: 8),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.grey[600],
                  size: 20,
                ),
              ),
            ] else
              const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}

class ChatMessage {
  final String? message;
  final Companion sender;
  final DateTime timestamp;
  final File? imageFile;
  final bool isUserMessage;

  ChatMessage({
    this.message,
    required this.sender,
    required this.timestamp,
    this.imageFile,
    this.isUserMessage = false,
  });
}
