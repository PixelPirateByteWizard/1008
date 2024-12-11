import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../widgets/status_bar.dart';
import '../widgets/event_card.dart';
import '../screens/result_screen.dart';
import '../providers/game_provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Event? _currentEvent;
  String? _currentOutcome;
  bool _showingOutcome = false;

  @override
  void initState() {
    super.initState();
    _getNextEvent();
  }

  void _getNextEvent() {
    final gameProvider = context.read<GameProvider>();
    final nextEvent = gameProvider.getNextEvent();
    setState(() {
      _currentEvent = nextEvent;
      _currentOutcome = null;
      _showingOutcome = false;
    });
  }

  void _handleChoice(EventChoice choice) {
    final gameProvider = context.read<GameProvider>();
    if (_currentEvent != null) {
      gameProvider.processEventChoice(choice);

      setState(() {
        _currentOutcome = choice.outcome;
        _showingOutcome = true;
      });

      if (!gameProvider.isGameOver) {
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _getNextEvent();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '三国人生',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2C3E50),
              Color(0xFF3498DB),
              Color(0xFF2C3E50),
            ],
          ),
        ),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: SafeArea(
          child: Consumer<GameProvider>(
            builder: (context, gameProvider, child) {
              if (gameProvider.isGameOver) {
                return const ResultScreen();
              }

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const StatusBar(),
                  ),
                  if (_currentEvent != null)
                    Expanded(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: EventCard(
                              event: _currentEvent!,
                              onChoiceSelected: _handleChoice,
                            ),
                          ),
                          if (_showingOutcome && _currentOutcome != null)
                            Container(
                              color: Colors.black.withOpacity(0.7),
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(24),
                                  margin: const EdgeInsets.all(32),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2C3E50),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.3),
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.announcement_rounded,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        _currentOutcome!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          height: 1.5,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
