import 'package:flutter/material.dart';
import 'app_introduction_screen.dart';
import 'features_screen.dart';
import 'update_screen.dart';
import 'security_screen.dart';
import 'privacy_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/help_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(
              context,
              title: 'App Information',
              items: [
                SettingsItem(
                  icon: Icons.info_rounded,
                  iconColor: Colors.blue,
                  title: 'App Introduction',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppIntroductionScreen(),
                    ),
                  ),
                ),
                SettingsItem(
                  icon: Icons.new_releases_rounded,
                  iconColor: Colors.orange,
                  title: 'New Features',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeaturesScreen(),
                    ),
                  ),
                ),
                SettingsItem(
                  icon: Icons.system_update_rounded,
                  iconColor: Colors.green,
                  title: 'Version Update',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateScreen(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCard(
              context,
              title: 'Security & Privacy',
              items: [
                SettingsItem(
                  icon: Icons.security_rounded,
                  iconColor: Colors.red,
                  title: 'App Security',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecurityScreen(),
                    ),
                  ),
                ),
                SettingsItem(
                  icon: Icons.privacy_tip_rounded,
                  iconColor: Colors.purple,
                  title: 'Privacy Protection',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyScreen(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildCard(
              context,
              title: 'Support',
              items: [
                SettingsItem(
                  icon: Icons.contact_support_rounded,
                  iconColor: Colors.teal,
                  title: 'Contact Us',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactScreen(),
                    ),
                  ),
                ),
                SettingsItem(
                  icon: Icons.help_rounded,
                  iconColor: Colors.amber,
                  title: 'Help Center',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required List<SettingsItem> items,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(),
          ...items.map((item) => _buildListItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildListItem(SettingsItem item) {
    return ListTile(
      leading: Icon(
        item.icon,
        color: item.iconColor,
      ),
      title: Text(item.title),
      trailing: const Icon(Icons.chevron_right),
      onTap: item.onTap,
    );
  }
}

class SettingsItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });
}
