import 'package:flutter/material.dart';

class AppTheme {
  // 主题色
  static const Color primaryColor = Color(0xFFFF6B9C);
  static const Color secondaryColor = Color(0xFFFFC7D9);
  static const Color backgroundColor = Color(0xFFFFF0F5);
  static const Color textColor = Color(0xFF2C1810);
  static const Color accentColor = Color(0xFFFF4081);

  // 文字样式
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 18,
    color: textColor,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: textColor,
  );

  // 装饰样式
  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );

  // 主题数据
  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: titleStyle,
      headlineMedium: subtitleStyle,
      bodyLarge: bodyStyle,
    ),
    useMaterial3: true,
  );
}
