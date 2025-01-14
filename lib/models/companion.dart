import 'package:flutter/material.dart';

@immutable
class Companion {
  final String id;
  final String name;
  final String avatarAsset;
  final String characterType;
  final List<SkillIcon> skillIcons;
  final String skillDescription;
  final List<Skill> skills;
  final Color themeColor;

  const Companion({
    required this.id,
    required this.name,
    required this.avatarAsset,
    required this.characterType,
    required this.skillIcons,
    required this.skillDescription,
    required this.skills,
    required this.themeColor,
  });
}

class SkillIcon {
  final IconData icon;
  final Color color;

  const SkillIcon({
    required this.icon,
    required this.color,
  });
}

class Skill {
  final String name;
  final List<String> insights;

  const Skill({
    required this.name,
    required this.insights,
  });
}
