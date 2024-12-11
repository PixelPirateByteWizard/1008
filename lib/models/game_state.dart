import 'package:flutter/foundation.dart';
import 'character.dart';
import 'event.dart';

class GameState extends ChangeNotifier {
  Character? character;
  List<Event> eventHistory = [];
  int age = 15;
  bool isGameOver = false;

  void initializeCharacter(Character newCharacter) {
    character = newCharacter;
    notifyListeners();
  }

  void processEvent(Event event) {
    // 处理事件逻辑
    eventHistory.add(event);
    age++;
    notifyListeners();
  }
}
