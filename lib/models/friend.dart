import 'package:flutter/foundation.dart';

@immutable
class Friend {
  final String id;
  final String name;
  final String avatarAsset;

  const Friend({
    required this.id,
    required this.name,
    required this.avatarAsset,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatarAsset': avatarAsset,
      };

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        id: json['id'] as String,
        name: json['name'] as String,
        avatarAsset: json['avatarAsset'] as String,
      );
}
