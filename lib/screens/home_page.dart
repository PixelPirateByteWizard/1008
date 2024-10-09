import 'package:flutter/material.dart';
import 'todo_page.dart';
import 'shopping_list_page.dart';
import 'statistics_page.dart';
import 'more_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<TodoItem> _todos = [];
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      TodoPage(todos: _todos),
      const ShoppingListPage(),
      StatisticsPage(todos: _todos),
      const MorePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[100], // Light grey background for better contrast

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Colors.blueAccent, // Modern and visually appealing color
        unselectedItemColor:
            Colors.grey, // Grey for unselected items for better contrast
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Colors.white, // White background for clarity and modern feel
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
      ),
    );
  }
}
