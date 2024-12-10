import 'package:flutter/material.dart';
import '../models/chat_assistant.dart';
import 'dart:math';

class AIConversationScreen extends StatefulWidget {
  final String initialQuestion;
  final IconData questionIcon;
  final String category;
  final Color categoryColor;
  final Color categoryTextColor;

  const AIConversationScreen({
    super.key,
    required this.initialQuestion,
    required this.questionIcon,
    required this.category,
    required this.categoryColor,
    required this.categoryTextColor,
  });

  @override
  State<AIConversationScreen> createState() => _AIConversationScreenState();
}

class _AIConversationScreenState extends State<AIConversationScreen>
    with TickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool _isComposing = false;
  bool _isWaitingResponse = false;
  bool _mounted = true;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_mounted) {
        _sendInitialQuestion();
      }
    });
  }

  Future<void> _sendInitialQuestion() async {
    if (!_mounted) return;
    setState(() {
      _messages.add(ChatMessage(
        text: widget.initialQuestion,
        isUser: true,
      ));
      _isWaitingResponse = true;
    });

    try {
      final response = await ChatAssistant().sendQuery(widget.initialQuestion);
      if (_mounted) {
        setState(() {
          _isWaitingResponse = false;
          _messages.add(ChatMessage(
            text: response,
            isUser: false,
          ));
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (_mounted) {
        setState(() {
          _isWaitingResponse = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _mounted = false;
    _animationController.dispose();
    if (_messageController.hasListeners) {
      _messageController.dispose();
    }
    if (_scrollController.hasListeners) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.categoryTextColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: widget.categoryColor,
                child: Icon(
                  widget.questionIcon,
                  color: widget.categoryTextColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'AI Assistant',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length + (_isWaitingResponse ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _messages.length && _isWaitingResponse) {
                    return _buildTypingIndicator();
                  }
                  final message = _messages[index];
                  return message.isUser
                      ? _buildSentMessage(message.text)
                      : _buildReceivedMessage(message.text);
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildReceivedMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: widget.categoryColor,
            child: Icon(
              widget.questionIcon,
              color: widget.categoryTextColor,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.categoryTextColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 16,
            backgroundColor: widget.categoryTextColor,
            child: const Text(
              'U',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                maxLines: 4,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(fontSize: 16),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.trim().isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  isDense: true,
                ),
                enabled: !_isWaitingResponse,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color:
                    _isComposing ? widget.categoryTextColor : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: _isComposing ? _sendMessage : null,
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      if (!_mounted) return;
      setState(() {
        _messages.add(ChatMessage(text: message, isUser: true));
        _isComposing = false;
        _isWaitingResponse = true;
      });
      _messageController.clear();
      _scrollToBottom();

      try {
        final response = await ChatAssistant().sendQuery(message);
        if (_mounted) {
          setState(() {
            _isWaitingResponse = false;
            _messages.add(ChatMessage(text: response, isUser: false));
          });
          _scrollToBottom();
        }
      } catch (e) {
        if (_mounted) {
          setState(() {
            _isWaitingResponse = false;
          });
        }
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: widget.categoryColor,
            child: Icon(
              widget.questionIcon,
              color: widget.categoryTextColor,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) => _buildAnimatedDot(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedDot(int index) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          child: Transform.translate(
            offset: Offset(
                0, -6 * sin(_animationController.value * 2 * pi + index)),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: widget.categoryTextColor.withOpacity(0.7),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: widget.categoryTextColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}
