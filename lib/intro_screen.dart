import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';
import 'l10n/app_localizations.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> _introKeys = [
    'intro1',
    'intro2',
    'intro3',
    'intro4',
    'intro5',
    'intro6',
    'intro7',
    'intro8',
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

      if (_currentCharIndex <
          AppLocalizations.of(context)
              .translate(_introKeys[_currentTextIndex])
              .length) {
        setState(() {
          _currentText = AppLocalizations.of(context)
              .translate(_introKeys[_currentTextIndex])
              .substring(0, _currentCharIndex + 1);
          _currentCharIndex++;
        });
      } else {
        timer.cancel();
        if (_currentTextIndex < _introKeys.length - 1) {
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
                            AppLocalizations.of(context)
                                .translate(_introKeys[i]),
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
                  AppLocalizations.of(context).translate('clickToSkip'),
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
