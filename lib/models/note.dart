import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String content;

  @HiveField(2)
  late DateTime createdAt;

  @HiveField(3)
  late String category;

  @HiveField(4)
  late int color;

  Note({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.category,
    required this.color,
  });
}
