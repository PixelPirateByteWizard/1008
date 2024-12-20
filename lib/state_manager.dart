import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants.dart';

// 游戏状态提供者
final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>(
  (ref) => GameStateNotifier(),
);

// 添加历史记录项类
class HistoryEntry {
  final String action; // 玩家选择的动作
  final String scene; // 场景描述
  final DateTime timestamp; // 时间戳

  const HistoryEntry({
    required this.action,
    required this.scene,
    required this.timestamp,
  });

  // JSON序列化
  Map<String, dynamic> toJson() => {
        'action': action,
        'scene': scene,
        'timestamp': timestamp.toIso8601String(),
      };

  // JSON反序列化
  factory HistoryEntry.fromJson(Map<String, dynamic> json) => HistoryEntry(
        action: json['action'] as String,
        scene: json['scene'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
      );
}

// 游戏状态类
class GameState {
  final int gold;
  final int food;
  final int troops;
  final int reputation;
  final String currentScene;
  final List<String> availableActions;
  final List<HistoryEntry> eventHistory;
  final String playerName;

  const GameState({
    this.gold = GameConstants.initialGold,
    this.food = GameConstants.initialFood,
    this.troops = GameConstants.initialTroops,
    this.reputation = GameConstants.initialReputation,
    this.currentScene = GameConstants.initialScene,
    this.availableActions = GameConstants.initialActions,
    this.eventHistory = const [],
    this.playerName = '',
  });

  // 从JSON构造
  factory GameState.fromJson(Map<String, dynamic> json) {
    return GameState(
      gold: json['gold'] as int? ?? GameConstants.initialGold,
      food: json['food'] as int? ?? GameConstants.initialFood,
      troops: json['troops'] as int? ?? GameConstants.initialTroops,
      reputation: json['reputation'] as int? ?? GameConstants.initialReputation,
      currentScene:
          json['currentScene'] as String? ?? GameConstants.initialScene,
      availableActions: (json['availableActions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          GameConstants.initialActions,
      eventHistory: (json['eventHistory'] as List<dynamic>?)
              ?.map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerName: json['playerName'] as String? ?? '',
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'gold': gold,
      'food': food,
      'troops': troops,
      'reputation': reputation,
      'currentScene': currentScene,
      'availableActions': availableActions,
      'eventHistory': eventHistory.map((e) => e.toJson()).toList(),
      'playerName': playerName,
    };
  }

  // 复制并更新状态
  GameState copyWith({
    int? gold,
    int? food,
    int? troops,
    int? reputation,
    String? currentScene,
    List<String>? availableActions,
    List<HistoryEntry>? eventHistory,
    String? playerName,
  }) {
    return GameState(
      gold: gold ?? this.gold,
      food: food ?? this.food,
      troops: troops ?? this.troops,
      reputation: reputation ?? this.reputation,
      currentScene: currentScene ?? this.currentScene,
      availableActions: availableActions ?? this.availableActions,
      eventHistory: eventHistory ?? this.eventHistory,
      playerName: playerName ?? this.playerName,
    );
  }

  @override
  String toString() {
    return 'GameState(gold: $gold, food: $food, troops: $troops, reputation: $reputation)';
  }
}

// 游戏状态管理器
class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(const GameState()) {
    _initializeState();
  }

  void _initializeState() {
    state = const GameState(
      gold: GameConstants.initialGold,
      food: GameConstants.initialFood,
      troops: GameConstants.initialTroops,
      reputation: GameConstants.initialReputation,
      availableActions: GameConstants.initialActions,
    );
  }

  // 直接设置状态
  void setState(GameState newState) {
    state = newState;
  }

  // 更新资源
  void updateResources({
    int? gold,
    int? food,
    int? troops,
    int? reputation,
  }) {
    state = state.copyWith(
      gold: gold?.clamp(GameConstants.minGold, GameConstants.maxGold) ??
          state.gold,
      food: food?.clamp(GameConstants.minFood, GameConstants.maxFood) ??
          state.food,
      troops: troops?.clamp(GameConstants.minTroops, GameConstants.maxTroops) ??
          state.troops,
      reputation: reputation?.clamp(
              GameConstants.minReputation, GameConstants.maxReputation) ??
          state.reputation,
    );
  }

  // 设置场景和可用动作
  void setScene(String scene, List<String> actions) {
    state = state.copyWith(
      currentScene: scene,
      availableActions: actions,
    );
  }

  // 添加事件到历史记录
  void addToHistory(String action, String scene) {
    state = state.copyWith(
      eventHistory: [
        ...state.eventHistory,
        HistoryEntry(
          action: action,
          scene: scene,
          timestamp: DateTime.now(),
        ),
      ],
    );
  }

  // 设置玩家名称
  void setPlayerName(String name) {
    state = state.copyWith(playerName: name);
  }
}
