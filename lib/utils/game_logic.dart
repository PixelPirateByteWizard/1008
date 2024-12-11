import '../models/character.dart';
import '../models/event.dart';

class GameLogic {
  static bool canTriggerEvent(
      Event event, Character character, int currentYear) {
    // 检查事件触发条件
    if (event.triggerYear != null && event.triggerYear != currentYear) {
      return false;
    }

    // 检查属性要求
    final characterAttributes = {
      'military': character.military,
      'intelligence': character.intelligence,
      'leadership': character.leadership,
      'politics': character.politics,
    };

    return event.checkRequirements(characterAttributes, currentYear);
  }

  static void applyEventEffects(EventChoice choice, Character character) {
    // 应用事件选项效果到角色属性
    choice.effects.forEach((attribute, value) {
      switch (attribute) {
        case 'military':
          character.military =
              (character.military + value.toInt()).clamp(0, 10);
          break;
        case 'intelligence':
          character.intelligence =
              (character.intelligence + value.toInt()).clamp(0, 10);
          break;
        case 'leadership':
          character.leadership =
              (character.leadership + value.toInt()).clamp(0, 10);
          break;
        case 'politics':
          character.politics =
              (character.politics + value.toInt()).clamp(0, 10);
          break;
      }
    });
  }

  static String evaluateLife(Character character) {
    // 计算总属性点数
    final totalPoints = character.military +
        character.intelligence +
        character.leadership +
        character.politics;

    // 根据角色最终属性评价人生
    if (totalPoints >= 32) {
      return '盖世英雄';
    } else if (totalPoints >= 24) {
      return '一代枭雄';
    } else if (totalPoints >= 16) {
      return '功成名就';
    } else {
      return '碌碌无为';
    }
  }

  static bool isGameOver(int age, int year) {
    return age >= 60 || year >= 280;
  }
}
