import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> _introTexts = [
    "建安元年（196年）",
    "汉室倾颓，天下大乱",
    "曹操挟天子以令诸侯",
    "孙策跨江东，割据六郡",
    "刘备寄身他乡，待时而动",
    "群雄并起，逐鹿中原",
    "你，将在这乱世之中",
    "开创属于自己的霸业...",
  ];

  int _currentTextIndex = 0;
  String _currentText = "";
  int _currentCharIndex = 0;
  bool _skipIntro = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_skipIntro) {
        _navigateToHome();
        return;
      }

      if (_currentCharIndex < _introTexts[_currentTextIndex].length) {
        setState(() {
          _currentText = _introTexts[_currentTextIndex]
              .substring(0, _currentCharIndex + 1);
          _currentCharIndex++;
        });
      } else {
        timer.cancel();
        if (_currentTextIndex < _introTexts.length - 1) {
          Future.delayed(const Duration(milliseconds: 800), () {
            if (mounted && !_skipIntro) {
              setState(() {
                _currentTextIndex++;
                _currentCharIndex = 0;
                _currentText = "";
              });
              _startTyping();
            }
          });
        } else {
          Future.delayed(const Duration(seconds: 2), _navigateToHome);
        }
      }
    });
  }

  void _navigateToHome() {
    _timer?.cancel();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  void _handleTap() {
    setState(() {
      _skipIntro = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Scaffold(
        backgroundColor: const Color(0xFF2C1810),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/paper_texture.png'),
              fit: BoxFit.cover,
              opacity: 0.1,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: [
                      for (int i = 0; i < _currentTextIndex; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            _introTexts[i],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              height: 1.5,
                            ),
                          ),
                        ),
                      if (_currentText.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            _currentText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              height: 1.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  '点击屏幕跳过',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
