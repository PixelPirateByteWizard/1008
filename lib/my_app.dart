import 'package:flutter/material.dart';
import 'crypto_list_page.dart';
import 'crypto_market_page.dart';
import 'crypto_news_page.dart';
import 'profile_page.dart';
import 'ai_assistant_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const CryptoListPage(),
    CryptoMarketPage(),
    const CryptoNewsPage(),
    const AIAssistantPage(), // 新增AI助手页面
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 添加此行
      title: '加密货币应用',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: '加密货币行情'),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart), label: '市值排行'),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: '加密货币资讯'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), label: 'AI助手'), // 新增AI助手选项
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人中心'),
          ],
        ),
      ),
    );
  }
}
