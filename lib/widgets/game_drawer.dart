import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GameDrawer extends StatelessWidget {
  const GameDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppTheme.primaryColor, AppTheme.backgroundColor],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Urban Love Life',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your Romance Adventure',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.save),
              title: const Text('Save Game'),
              onTap: () {
                // TODO: Implement save game functionality
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restore),
              title: const Text('Load Game'),
              onTap: () {
                // TODO: Implement load game functionality
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Navigate to settings screen
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Show help dialog
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                // TODO: Show about dialog
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
