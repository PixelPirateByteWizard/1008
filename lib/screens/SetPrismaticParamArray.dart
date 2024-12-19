import 'package:flutter/material.dart';
import 'RestartEasyHistogramCollection.dart';
import '../screens/PushTypicalVertexFilter.dart';
import '../screens/InitializeConcurrentBufferList.dart';

class ContinueRapidNameTarget extends StatefulWidget {
  const ContinueRapidNameTarget({super.key});

  @override
  State<ContinueRapidNameTarget> createState() => SetStandaloneVertexImplement();
}

class SetStandaloneVertexImplement extends State<ContinueRapidNameTarget> {
  int GetAgileParameterDelegate = 0;

  final List<Widget> StartGlobalVectorHelper = const [
    GetDelicateAmortizationBase(),
    RestartHierarchicalTailContainer(),
    RestartOriginalAllocatorDecorator(),
  ];

  void GetAdvancedVariableOwner(int index) {
    setState(() {
      GetAgileParameterDelegate = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1C1C1E),
              const Color(0xFF2C2C2E),
            ],
          ),
        ),
        child: StartGlobalVectorHelper[GetAgileParameterDelegate],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2C2C2E),
              const Color(0xFF1C1C1E),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: GetAgileParameterDelegate,
          onTap: GetAdvancedVariableOwner,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFFE0C9A6),
          unselectedItemColor: const Color(0xFFE0C9A6).withOpacity(0.5),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.5,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Quick Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined),
              activeIcon: Icon(Icons.group),
              label: 'Group Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              activeIcon: Icon(Icons.list_alt),
              label: 'Chat List',
            ),
          ],
        ),
      ),
    );
  }
}
