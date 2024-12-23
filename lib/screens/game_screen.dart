import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import '../theme/app_theme.dart';
import '../widgets/status_indicator.dart';
import '../game_state_manager.dart';
import '../auravelleService.dart';
import '../screens/history_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  final GameStateManager _gameState = GameStateManager();
  final auravelleService _aiService = auravelleService();
  String _currentScene =
      'Welcome to Urban Love Life!\nStart your romantic journey!';
  List<String> _currentChoices = ['Start Game', 'Load Game', 'Settings'];
  bool _isLoading = false;
  String _displayedScene = '';
  bool _isTyping = false;
  Timer? _typeTimer;
  bool _showChoices = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _initializeGame() async {
    setState(() => _isLoading = true);
    await _gameState.initialize();

    if (_gameState.currentScene.isEmpty) {
      // For new game, send initialization request
      await _startNewGame();
    } else {
      // Load saved scene and choices
      setState(() {
        _currentScene = _gameState.currentScene;
        _displayedScene = _currentScene;
        // Load choices from save
        final savedChoices = _gameState.eventHistory.isNotEmpty
            ? _gameState.eventHistory.first
            : null;
        if (savedChoices != null) {
          _currentChoices = savedChoices.split('|');
          _showChoices = true;
        }
      });
    }
    setState(() {
      _isLoading = false;
      if (_currentScene.isEmpty) {
        // For brand new game, show welcome message
        _currentScene =
            'Welcome to Urban Love Life!\nStart your romantic journey!';
        _displayedScene = _currentScene;
        _currentChoices = ['Start Game', 'Load Game', 'Settings'];
        _showChoices = true;
      }
    });
  }

  Future<void> _startNewGame() async {
    final initialScene =
        '''At 8:30 AM, you're standing in the lobby of Startech Building.
You are a young graduate, and today is your first day at your dream company - Startech.
As a newly hired programmer, you are about to begin your new career journey.
"''';

    final initialChoices = [
      "Hello, I'm the new programmer, reporting for my first day.",
      "Could you tell me where the HR department is? I need to complete my onboarding.",
      "What a lovely morning, the environment here is really nice."
    ];

    // Update game state with initial values
    await _gameState.updateState({
      'intimacy': 0,
      'favorability': 0,
      'energy': 100,
      'mood': 80,
      'money': 1000,
      'currentScene': initialScene,
    });

    // Save initial choices to history
    await _gameState.addEventHistory(initialChoices.join('|'));
    await _gameState.addSceneHistory(initialScene);

    // Update UI
    setState(() {
      _currentScene = initialScene;
      _currentChoices = initialChoices;
      _isLoading = false;
      _displayedScene = '';
      _showChoices = false;
      _startTypingAnimation();
    });
  }

  Future<void> _processAiResponse(String response) async {
    try {
      // Parse AI response
      final sections = response.split('###').map((s) => s.trim()).toList();

      String scene = '';
      Map<String, dynamic> status = {};
      List<String> choices = [];

      for (var section in sections) {
        if (section.startsWith('Scene Description')) {
          scene = section.replaceFirst('Scene Description', '').trim();
        } else if (section.startsWith('Character Status')) {
          final statusText =
              section.replaceFirst('Character Status', '').trim();
          status = Map<String, dynamic>.from(jsonDecode(statusText));
        } else if (section.startsWith('Available Actions')) {
          choices = section
              .replaceFirst('Available Actions', '')
              .trim()
              .split('\n')
              .where((line) => line.isNotEmpty)
              .map((line) =>
                  line.replaceAll(RegExp(r'^\d+\.\s*\*\*|\*\*.*$'), '').trim())
              .where((line) => line.isNotEmpty)
              .toList();
        }
      }

      // Update game state
      if (status.isNotEmpty) {
        await _gameState.updateState({
          'intimacy': status['Intimacy'] ?? _gameState.intimacy,
          'favorability': status['Favorability'] ?? _gameState.favorability,
          'energy': status['Energy'] ?? _gameState.energy,
          'mood': status['Mood'] ?? _gameState.mood,
          'money': status['Money'] ?? _gameState.money,
          'currentScene': scene,
        });
      }

      // Save choices to history
      if (choices.isNotEmpty) {
        // Ensure choices is List<String>
        final choicesString = List<String>.from(choices).join('|');
        await _gameState.addEventHistory(choicesString);
      }

      // Save story to history
      if (scene.isNotEmpty) {
        await _gameState.addSceneHistory(scene);
      }

      // Update interface
      setState(() {
        _currentScene = scene;
        _currentChoices = List<String>.from(choices); // Ensure type conversion
        _isLoading = false;
        _displayedScene = '';
        _showChoices = false;
        _startTypingAnimation();
      });
    } catch (e) {
      _showError('Error processing response: $e');
    }
  }

  Future<void> _handleChoice(String choice) async {
    setState(() => _isLoading = true);

    try {
      final response = await _aiService.processQuery(
          _gameState.getStatusDescription() +
              '\nCurrent Scene: $_currentScene\n' +
              'Player Choice: $choice');

      await _processAiResponse(response);
    } catch (e) {
      _showError('Error processing choice, please try again');
    }
  }

  void _showError(String message) {
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _startTypingAnimation() {
    int index = 0;
    setState(() => _isTyping = true);

    _typeTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (index < _currentScene.length) {
        setState(() {
          _displayedScene = _currentScene.substring(0, index + 1);
          index++;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
          );
        });
      } else {
        timer.cancel();
        setState(() {
          _isTyping = false;
          _showChoices = true;
        });
      }
    });
  }

  // Add method to show help dialog
  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Help'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Game Description:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                    'This is an urban romance text adventure game. You\'ll play as a newly hired programmer finding romance in the workplace.'),
                SizedBox(height: 16),
                Text('Status Description:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                    '• Energy: Affects your work efficiency and daily activities\n'
                    '• Mood: Influences your choice effects and story direction\n'
                    '• Intimacy: Shows relationship progress with characters\n'
                    '• Favorability: Affects characters\' attitudes towards you\n'
                    '• Money: Used for purchasing items and participating in activities'),
                SizedBox(height: 16),
                Text('How to Play:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('1. Read the story description\n'
                    '2. Choose your desired action from the bottom options\n'
                    '3. Click the history button in the top right to view past events'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: AppTheme.primaryColor,
            ),
            onPressed: _showHelpDialog,
          ),
          IconButton(
            icon: const Icon(
              Icons.history,
              color: AppTheme.primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.backgroundColor, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // Status bar
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
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
                    margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: StatusIndicator(
                                label: 'Energy',
                                value: _gameState.energy,
                                color: const Color(0xFF4CAF50),
                                maxValue: 100,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: StatusIndicator(
                                label: 'Mood',
                                value: _gameState.mood,
                                color: const Color(0xFFFF9800),
                                maxValue: 100,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: StatusIndicator(
                                label: 'Intimacy',
                                value: _gameState.intimacy,
                                color: AppTheme.primaryColor,
                                maxValue: 100,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: StatusIndicator(
                                label: 'Favor',
                                value: _gameState.favorability,
                                color: const Color(0xFFE91E63),
                                maxValue: 100,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.monetization_on,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${_gameState.money}',
                                style: AppTheme.subtitleStyle.copyWith(
                                  color: Colors.amber[800],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Story display area
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(20),
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
                        controller: _scrollController,
                        child: Text(
                          _displayedScene,
                          style: AppTheme.bodyStyle.copyWith(
                            height: 1.6,
                            fontSize: 16,
                          ),
                          softWrap: true,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),

                  // Choice area
                  if (!_isTyping && _showChoices)
                    Container(
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: _currentChoices.map((choice) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: ElevatedButton(
                              onPressed: _isLoading
                                  ? null
                                  : () => _handleChoice(choice),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 16,
                                ),
                                minimumSize: const Size(double.infinity, 54),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27),
                                ),
                                elevation: 2,
                              ),
                              child: Text(
                                choice,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
              if (_isLoading)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
