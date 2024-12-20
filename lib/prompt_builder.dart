import 'constants.dart';
import 'dart:developer' as developer;
import 'state_manager.dart';

class PromptBuilder {
  static String buildSystemPrompt() {
    return GameConstants.aiSystemPrompt;
  }

  static String buildGamePrompt(GameState state, String playerAction) {
    final currentState = '''
当前状态:
- 势力: ${state.playerName.isNotEmpty ? state.playerName : '新兴诸侯'}
- 金钱: ${state.gold} (用于招募士兵、购买装备)
- 粮草: ${state.food} (维持军队、救济百姓)
- 兵力: ${state.troops} (军队规模)
- 声望: ${state.reputation} (影响外交和民心)
''';

    final historyContext = state.eventHistory.isNotEmpty
        ? '\n\n最近事件:\n${state.eventHistory.take(3).join("\n")}'
        : '';

    final prompt = '''
$currentState

当前场景:
${state.currentScene}

玩家选择的行动: $playerAction$historyContext

请按照系统设定的格式描述事件发展，注意资源变化要基于当前状态计算。
''';

    developer.log('发送给 AI 的状态: $currentState');

    return prompt;
  }
}
