class EventChoice {
  final String text;
  final Map<String, int> effects;
  final String outcome;

  const EventChoice({
    required this.text,
    required this.effects,
    required this.outcome,
  });
}

class Event {
  final String id;
  final String title;
  final String description;
  final List<EventChoice> choices;
  final Map<String, int> requirements; // 触发条件：属性要求
  final int? triggerYear; // 特定历史年份触发
  final List<String> tags; // 事件标签：如 战争、政治、个人等

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.choices,
    this.requirements = const {},
    this.triggerYear,
    this.tags = const [],
  });

  // 检查是否满足触发条件
  bool checkRequirements(Map<String, int> attributes, int currentYear) {
    if (triggerYear != null && currentYear != triggerYear) {
      return false;
    }

    for (var requirement in requirements.entries) {
      if (attributes[requirement.key] == null ||
          attributes[requirement.key]! < requirement.value) {
        return false;
      }
    }
    return true;
  }
}
