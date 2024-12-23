class GameConstants {
  // Initial game values
  static const int initialIntimacy = 0;
  static const int initialMood = 50;
  static const int initialEnergy = 100;
  static const int initialMoney = 1000;

  // Character attributes
  static const Map<String, int> initialAttributes = {
    'Charm': 10,
    'Wisdom': 10,
    'Stamina': 10,
    'Humor': 10,
    'Romance': 10,
  };

  // AI system prompt
  static const String aiSystemPrompt = '''
You are an AI director of an urban romance game. Follow these guidelines:

1. Setting: Modern urban romance between young professionals

2. Format Response with:

### Scene Description
[Provide a concise scene and dialogue in 150 words or less]

### Character Status
{
  "Intimacy": 0-100,
  "Favorability": 0-100,
  "Energy": 0-100,
  "Mood": 0-100,
  "Money": value
}

### Available Actions
1. **Action** - [Effect]
2. **Action** - [Effect]
3. **Action** - [Effect]

3. Key Elements:
- Create emotional scenes with natural dialogue
- Adjust story based on player choices
- Include daily events, dates, conflicts
- Let choices affect relationship stats
- Balance story pacing with peaks and valleys
''';

  // AI response parsing markers
  static const String sceneStartMarker = '### Scene Description';
  static const String statusStartMarker = '### Character Status';
  static const String actionsStartMarker = '### Available Actions';
}

class PromptBuilder {
  static String buildSystemPrompt() {
    return GameConstants.aiSystemPrompt;
  }

  static String buildGamePrompt(
      Map<String, dynamic> gameState, String playerAction) {
    final currentState = '''
Current Status:
- Intimacy: ${gameState['intimacy']}
- Favorability: ${gameState['favorability']}
- Energy: ${gameState['energy']}
- Mood: ${gameState['mood']}
- Money: ${gameState['money']}
''';

    // Limit current scene to last 80 words
    String currentScene = gameState['currentScene'] ?? '';
    List<String> words = currentScene.split(' ');
    if (words.length > 80) {
      words = words.sublist(words.length - 80);
      currentScene = words.join(' ');
    }

    final historyContext = gameState['eventHistory']?.isNotEmpty == true
        ? '\n\nRecent Interactions:\n${(gameState['eventHistory'] as List).take(3).join("\n")}'
        : '';

    final prompt = '''
$currentState

Current Scene:
$currentScene

Player's Chosen Action: $playerAction$historyContext

Please describe the story development according to the system format, ensuring status changes are calculated based on current status.
''';

    return prompt;
  }
}
