import 'package:flutter/material.dart';

class GameTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B0000),
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C1810), // 深褐色
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            height: 1.5,
            color: Color(0xFF2C1810),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF2C1810),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.brown.shade50,
        ),
      );
}
