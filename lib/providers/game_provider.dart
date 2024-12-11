import 'package:flutter/foundation.dart';
import 'dart:math';
import '../models/character.dart';
import '../models/event.dart';
import '../data/events_data.dart';
import '../utils/game_logic.dart';

class GameProvider with ChangeNotifier {
  Character? _character;
  List<String> _eventHistory = [];
  Event? _currentEvent;
  bool _isGameOver = false;
  int _age = 15; // 开始年份设定在黄巾之乱爆发前
  int _year = 184;
  final Random _random = Random();

  // Getters
  Character? get character => _character;
  bool get isGameOver => _isGameOver;
  int get age => _age;
  int get year => _year;
  Event? get currentEvent => _currentEvent;

  // 初始化角色
  void initializeCharacter(Character character, int startYear, int startAge) {
    _character = character;
    _year = startYear;
    _age = startAge;
    _eventHistory.clear();
    _currentEvent = null;
    _isGameOver = false;
    notifyListeners();
  }

  // 获取下一个事件
  Event? getNextEvent() {
    if (_character == null) return null;

    Map<String, int> attributes = {
      'military': _character!.military,
      'intelligence': _character!.intelligence,
      'leadership': _character!.leadership,
      'politics': _character!.politics,
    };

    // 检查是否有特定年份的历史事件
    final historicalEvents = getHistoricalEventsByYear(_year);
    if (historicalEvents.isNotEmpty) {
      for (var event in historicalEvents) {
        if (!_eventHistory.contains(event.id) &&
            event.checkRequirements(attributes, _year)) {
          _currentEvent = event;
          return event;
        }
      }
    }

    // 检查是否触发特殊事件（基于属性）
    if (_random.nextInt(100) < 20) {
      // 20%概率检查特殊事件
      final specialEvents = getSpecialEvents(attributes);
      final availableSpecialEvents = specialEvents
          .where((event) => !_eventHistory.contains(event.id))
          .toList();
      if (availableSpecialEvents.isNotEmpty) {
        _currentEvent = availableSpecialEvents[
            _random.nextInt(availableSpecialEvents.length)];
        return _currentEvent;
      }
    }

    // 获取可用的随机事件
    final randomEvents = getRandomEvents();
    // 过滤掉已经触发过的事件，但如果所有事件都触发过了，就重置历史
    var availableRandomEvents = randomEvents
        .where((event) => !_eventHistory.contains(event.id))
        .toList();
    
    if (availableRandomEvents.isEmpty) {
      // 如果没有可用的随机事件，清空历史记录重新开始
      // 但保留历史事件的记录，以免重复触发历史事件
      _eventHistory.removeWhere((eventId) => 
        randomEvents.any((e) => e.id == eventId));
      availableRandomEvents = randomEvents;
    }

    // 根据玩家属性筛选合适的随机事件
    final suitableEvents = availableRandomEvents.where((event) {
      if (event.requirements.isEmpty) return true;
      return event.checkRequirements(attributes, _year);
    }).toList();

    if (suitableEvents.isEmpty) {
      // 如果确实没有任何可用事件，才结束游戏
      if (randomEvents.isEmpty || _age >= 60 || _year >= 280) {
        _isGameOver = true;
        notifyListeners();
        return null;
      }
      // 否则返回一个基础随机事件
      _currentEvent = randomEvents[_random.nextInt(randomEvents.length)];
      return _currentEvent;
    }

    // 返回随机事件
    _currentEvent = suitableEvents[_random.nextInt(suitableEvents.length)];
    return _currentEvent;
  }

  // 处理事件选择
  void processEventChoice(EventChoice choice) {
    if (_character == null || _currentEvent == null) return;

    // 应用属性变化
    choice.effects.forEach((attribute, value) {
      switch (attribute) {
        case 'military':
          _character!.military =
              (_character!.military + value.toInt()).clamp(0, 10);
          break;
        case 'intelligence':
          _character!.intelligence =
              (_character!.intelligence + value.toInt()).clamp(0, 10);
          break;
        case 'leadership':
          _character!.leadership =
              (_character!.leadership + value.toInt()).clamp(0, 10);
          break;
        case 'politics':
          _character!.politics =
              (_character!.politics + value.toInt()).clamp(0, 10);
          break;
      }
    });

    // 记录事件历史
    _eventHistory.add(_currentEvent!.id);

    // 增加年龄和年份
    _age++;
    _year++;

    // 检查游戏结束条件
    _isGameOver = GameLogic.isGameOver(_age, _year);

    notifyListeners();
  }
}
