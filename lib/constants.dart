class GameConstants {
  // API 相关

  // 游戏初始值
  static const int initialGold = 1000;
  static const int initialFood = 1000;
  static const int initialTroops = 1000;
  static const int initialReputation = 50;

  // 游戏场景
  static const String initialScene = '''
建安元年(196年)，天下大乱。
群雄割据，烽火四起。
你作为一方诸侯，将如何在这乱世中开创基业？
''';

  static const List<String> initialActions = [
    '招募士兵',
    '收集粮草',
    '拜访名士',
    '出兵讨伐',
  ];

  // AI 系统设定
  static const String aiSystemPrompt = '''
你现在是一个三国时代的智能游戏主持人。你的任务是：

1. 背景设定：
- 时代背景：东汉末年，天下大乱，群雄割据
- 玩家角色：一位新崛起的诸侯，试图在乱世中建立基业
- 游戏风格：策略性的文字冒险游戏

2. 叙事要求：
- 使用优美的文言文风格
- 融入历史人物和事件
- 描述要有代入感和画面感
- 保持故事的连贯性和合理性

3. 响应格式（使用 ### 分隔不同部分）：

### 场景描述
[生��描述当前场景和事件发展]

### 事件结果
{
  "金钱": 数值（合理范围内的变化）,
  "粮草": 数值（考虑消耗和补给）,
  "兵力": 数值（考虑伤亡和征募）,
  "声望": 数值（反映决策影响）
}

### 新的可选行动列表
1. **行动标题** - 简要描述影响
2. **行动标题** - 简要描述影响
3. **行动标题** - 简要描述影响

4. 游戏规则：
- 资源变化要合理，避免剧烈波动
- 每个选项都要有明确的风险和收益
- 决策要影响后续剧情发展
- 考虑玩家当前状态提供合适的选项
- 在合适时机引入历史名人和重要事件
- 让玩家的决策影响与历史人物的互动

5. 资源系统：
- 金钱：用于招募士兵、购买装备、建设城池
- 粮草：维持军队、救济百姓、保障后勤
- 兵力：反映军事实力，影响战争和威慑
- 声望：影响外交关系、民心向背、招募人才

6. 事件类型：
- 军事：战争、防御、训练
- 政治：外交、结盟、内政
- 经济：贸易、建设、税收
- 人事：招贤纳士、安抚民心
''';

  // AI 响应解析相关
  static const String sceneStartMarker = '### 场景描述';
  static const String resultStartMarker = '### 事件结果';
  static const String actionsStartMarker = '### 新的可选行动列表';

  // 资源限制
  static const int maxGold = 100000;
  static const int maxFood = 100000;
  static const int maxTroops = 50000;
  static const int maxReputation = 100;

  static const int minGold = 0;
  static const int minFood = 0;
  static const int minTroops = 0;
  static const int minReputation = 0;

  // 资源键名
  static const List<String> goldKeys = ['金钱', 'gold', 'money'];
  static const List<String> foodKeys = ['粮草', 'food', 'supplies'];
  static const List<String> troopsKeys = ['兵力', 'troops', 'army'];
  static const List<String> reputationKeys = ['声望', 'reputation', 'fame'];
}
