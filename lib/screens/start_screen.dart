import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'game_screen.dart';
import 'dart:async';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final String _introText = '''
In this bustling metropolis, you are a newly hired programmer.
While chasing your dreams in the world of code,
perhaps you'll encounter a romantic urban love story...

Here, you will:
• Experience the daily life of a programmer
• Meet colleagues with diverse personalities
• Find balance between work and love
• Make choices that influence the story
• Create your own romantic story''';

  String _displayedText = '';
  bool _isTypingComplete = false;
  Timer? _typeTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _typeTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_currentIndex < _introText.length) {
        setState(() {
          _displayedText = _introText.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        timer.cancel();
        setState(() => _isTypingComplete = true);
      }
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.backgroundColor,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Title
                Text(
                  'Urban Love Story',
                  style: AppTheme.titleStyle.copyWith(
                    color: AppTheme.primaryColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 40),
                // Game Introduction
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        _displayedText,
                        style: AppTheme.bodyStyle.copyWith(
                          height: 1.8,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Start Button
                AnimatedOpacity(
                  opacity: _isTypingComplete ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: _isTypingComplete
                        ? () {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const GameScreen(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    child: const Text(
                      'Start Game',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
