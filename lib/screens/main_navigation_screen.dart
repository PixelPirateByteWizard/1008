import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/chat_list_screen.dart';
import '../screens/ai_chat_screen.dart';
import '../screens/settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ChatListScreen(),
    const AIChatScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1A1A1A).withOpacity(0.06),
              offset: const Offset(0, -4),
              blurRadius: 16,
            ),
          ],
        ),
        child: NavigationBar(
          height: 72,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined, color: Color(0xFF95A5A6)),
              selectedIcon: Icon(Icons.dashboard, color: Color(0xFF3498DB)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.forum_outlined, color: Color(0xFF95A5A6)),
              selectedIcon: Icon(Icons.forum, color: Color(0xFF3498DB)),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.smart_toy_outlined, color: Color(0xFF95A5A6)),
              selectedIcon: Icon(Icons.smart_toy, color: Color(0xFF3498DB)),
              label: 'AI Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline, color: Color(0xFF95A5A6)),
              selectedIcon: Icon(Icons.person, color: Color(0xFF3498DB)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
