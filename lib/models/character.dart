class Character {
  final String name;
  int military;    // 武力值
  int intelligence; // 智谋值
  int leadership;   // 统帅值
  int politics;     // 政治值
  String background; // 家世背景

  Character({
    required this.name,
    this.military = 0,
    this.intelligence = 0,
    this.leadership = 0,
    this.politics = 0,
    this.background = '平民',
  });

  Map<String, dynamic> toMap() {
    return {
      'military': military,
      'intelligence': intelligence,
      'leadership': leadership,
      'politics': politics,
      'name': name,
      'background': background,
    };
  }
}
