import 'package:flutter/material.dart';

class AICharacter {
  final String id;
  final String name;
  final int age;
  final String avatar;
  final String introduction;
  final String personality;
  final List<String> interests;
  final String greetingMessage;
  final Color themeColor;
  final String backgroundStory;
  final List<String> conversationTopics;
  final String favoriteEarringType;
  final List<String> collectionPhotos;
  final String collectionDescription;

  const AICharacter({
    required this.id,
    required this.name,
    required this.age,
    required this.avatar,
    required this.introduction,
    required this.personality,
    required this.interests,
    required this.greetingMessage,
    required this.themeColor,
    required this.backgroundStory,
    required this.conversationTopics,
    required this.favoriteEarringType,
    required this.collectionPhotos,
    required this.collectionDescription,
  });
}
