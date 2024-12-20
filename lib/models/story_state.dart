class StoryState {
  final int currentChapter;
  final String currentContent;
  final List<String> availableChoices;
  final List<String> previousChoices;
  final int reputation;
  final Map<String, int> relationships;

  const StoryState({
    this.currentChapter = 0,
    this.currentContent = '',
    this.availableChoices = const [],
    this.previousChoices = const [],
    this.reputation = 0,
    this.relationships = const {},
  });

  StoryState copyWith({
    int? currentChapter,
    String? currentContent,
    List<String>? availableChoices,
    List<String>? previousChoices,
    int? reputation,
    Map<String, int>? relationships,
  }) {
    return StoryState(
      currentChapter: currentChapter ?? this.currentChapter,
      currentContent: currentContent ?? this.currentContent,
      availableChoices: availableChoices ?? this.availableChoices,
      previousChoices: previousChoices ?? this.previousChoices,
      reputation: reputation ?? this.reputation,
      relationships: relationships ?? this.relationships,
    );
  }
}
