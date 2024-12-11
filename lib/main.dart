import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/start_screen.dart';
import 'screens/attribute_selection_screen.dart';
import 'screens/game_screen.dart';
import 'screens/result_screen.dart';
import 'providers/game_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '三国重开模拟器',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/attribute_selection': (context) => const AttributeSelectionScreen(),
        '/game': (context) => const GameScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
