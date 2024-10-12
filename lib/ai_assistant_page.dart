import 'package:flutter/material.dart';
import 'IntelligentService.dart';

class AIAssistantPage extends StatefulWidget {
  const AIAssistantPage({Key? key}) : super(key: key);

  @override
  _AIAssistantPageState createState() => _AIAssistantPageState();
}

class _AIAssistantPageState extends State<AIAssistantPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _chatHistory = [];
  final IntelligentService _intelligentService = IntelligentService();

  void _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _chatHistory.add({"role": "user", "content": text});
    });

    String response = await _intelligentService.createAnswer(text);
    setState(() {
      _chatHistory.add({"role": "assistant", "content": response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI助手',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // 将文字颜色设置为白色
          ),
        ),
        backgroundColor: Colors.blue, // 将 Colors.teal 改为 Colors.blue
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white
            ], // 将 Colors.teal.shade50 改为 Colors.blue.shade50
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: _chatHistory[index]["content"]!,
                    isUser: _chatHistory[index]["role"] == "user",
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: '输入您的问题...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: () => _handleSubmitted(_textController.text),
                      child: const Icon(Icons.send, color: Colors.white),
                      backgroundColor:
                          Colors.blue, // 将 Colors.teal 改为 Colors.blue
                      mini: true,
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
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({Key? key, required this.message, required this.isUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isUser
              ? Colors.blue
              : Colors.white, // 将 Colors.teal 改为 Colors.blue
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
