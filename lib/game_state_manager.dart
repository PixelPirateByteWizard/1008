import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'prompt_builder.dart';
import 'auravelleIAP/VisitAssociatedOpacityBase.dart';
import 'package:flutter/foundation.dart';

class GameStateManager with ChangeNotifier {
  static final GameStateManager _instance = GameStateManager._internal();
  late final SharedPreferences _prefs;

  // Current game state
  Map<String, dynamic> _gameState = {
    'intimacy': GameConstants.initialIntimacy,
    'favorability': 0,
    'energy': GameConstants.initialEnergy,
    'mood': GameConstants.initialMood,
    'money': GameConstants.initialMoney,
    'currentScene': '',
    'eventHistory': <String>[],
    'sceneHistory': <String>[],
  };

  // Singleton pattern
  factory GameStateManager() {
    return _instance;
  }

  GameStateManager._internal();

  // Initialize
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadState();
  }

  // Get current status
  Map<String, dynamic> get currentState => Map.from(_gameState);

  // Get individual attribute values
  int get intimacy => _gameState['intimacy'] as int;
  int get favorability => _gameState['favorability'] as int;
  int get energy => _gameState['energy'] as int;
  int get mood => _gameState['mood'] as int;
  int get money => _gameState['money'] as int;
  String get currentScene => _gameState['currentScene'] as String;
  List<String> get eventHistory =>
      List<String>.from(_gameState['eventHistory'] ?? []);
  List<String> get sceneHistory =>
      List<String>.from(_gameState['sceneHistory'] ?? []);

  // Update individual attribute
  Future<void> updateValue(String key, dynamic value) async {
    if (_gameState.containsKey(key)) {
      _gameState[key] = value;
      await saveState();
    }
  }

  // Batch update status
  Future<void> updateState(Map<String, dynamic> newState) async {
    _gameState.addAll(newState);
    await saveState();
  }

  // Increase/decrease value
  Future<void> modifyValue(String key, int amount) async {
    if (_gameState.containsKey(key) && _gameState[key] is int) {
      int newValue = _gameState[key] + amount;

      // Ensure value is within reasonable range
      switch (key) {
        case 'intimacy':
        case 'favorability':
        case 'mood':
          newValue = newValue.clamp(0, 100);
          break;
        case 'energy':
          newValue = newValue.clamp(0, GameConstants.initialEnergy);
          break;
        case 'money':
          newValue = newValue.clamp(0, 999999);
          break;
      }

      _gameState[key] = newValue;
      await saveState();
    }
  }

  // Add event history
  Future<void> addEventHistory(String event) async {
    List<String> history = List<String>.from(_gameState['eventHistory'] ?? []);
    history.insert(0, event);
    if (history.length > 10) {
      history.removeLast();
    }
    _gameState['eventHistory'] = history;
    await saveState();
  }

  // Reset game state
  Future<void> resetState() async {
    _gameState = {
      'intimacy': GameConstants.initialIntimacy,
      'favorability': 0,
      'energy': GameConstants.initialEnergy,
      'mood': GameConstants.initialMood,
      'money': GameConstants.initialMoney,
      'currentScene': '',
      'eventHistory': <String>[],
      'sceneHistory': <String>[],
    };
    await saveState();
  }

  // Save state to local storage
  Future<void> saveState() async {
    await _prefs.setString('gameState', jsonEncode(_gameState));
  }

  // Load state from local storage
  Future<void> loadState() async {
    final String? savedState = _prefs.getString('gameState');
    if (savedState != null) {
      _gameState = Map<String, dynamic>.from(jsonDecode(savedState));
    }
  }

  // Check if resources are sufficient
  bool hasEnoughResources({
    int? requiredMoney,
    int? requiredEnergy,
  }) {
    if (requiredMoney != null && money < requiredMoney) return false;
    if (requiredEnergy != null && energy < requiredEnergy) return false;
    return true;
  }

  // Get status description
  String getStatusDescription() {
    return '''
Current Status:
- Intimacy: $intimacy
- Favorability: $favorability
- Energy: $energy
- Mood: $mood
- Money: $money
''';
  }

  // Add scene to history
  Future<void> addSceneHistory(String scene) async {
    List<String> history = List<String>.from(_gameState['sceneHistory'] ?? []);
    history.add(scene);
    _gameState['sceneHistory'] = history;
    await saveState();
  }

  // Add setter for money
  set money(int value) {
    _gameState['money'] = value;
    notifyListeners();
  }

  // Modify addMoney method
  Future<void> addMoney(int amount) async {
    _gameState['money'] = (_gameState['money'] as int) + amount;
    await EndRequiredButtonCollection.SetDisparateScaleFactory(
        _gameState['money'] as int);
    notifyListeners();
  }

  // Add method to sync with IAP system
  Future<void> syncWithIAP() async {
    final iapBalance =
        await EndRequiredButtonCollection.ProvideActivatedLeftManager();
    _gameState['money'] = iapBalance;
    notifyListeners();
  }
}
