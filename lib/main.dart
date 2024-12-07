import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/shopping_list_screen.dart';
import 'screens/pet_management_screen.dart';
import 'screens/task_management_screen.dart';
import 'screens/settings_screen.dart';
import 'services/pet_care_service.dart';
import 'routes/pet_routes.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final petService = PetCareService(prefs: prefs);
  runApp(MyApp(petService: petService));
}

class MyApp extends StatelessWidget {
  final PetCareService petService;

  const MyApp({super.key, required this.petService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Famigoletix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HkznrDtx(
        yKjltVt: MainScreen(petService: petService),
      ),
      routes: PetRoutes.getRoutes(petService),
    );
  }
}

class MainScreen extends StatefulWidget {
  final PetCareService petService;

  const MainScreen({super.key, required this.petService});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ShoppingListScreen(),
      PetManagementScreen(petService: widget.petService),
      const TaskManagementScreen(),
      const SettingsScreen(),
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
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
