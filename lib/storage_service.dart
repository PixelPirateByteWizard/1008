import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'state_manager.dart';

class StorageService {
  static const String _gameStateKey = 'game_state';

  static Future<void> saveGame(GameState state) async {
    final prefs = await SharedPreferences.getInstance();
    final stateJson = jsonEncode(state.toJson());
    await prefs.setString(_gameStateKey, stateJson);
  }

  static Future<GameState?> loadGame() async {
    final prefs = await SharedPreferences.getInstance();
    final stateJson = prefs.getString(_gameStateKey);
    if (stateJson == null) return null;

    try {
      final stateMap = jsonDecode(stateJson) as Map<String, dynamic>;
      return GameState.fromJson(stateMap);
    } catch (e) {
      return null;
    }
  }
}
