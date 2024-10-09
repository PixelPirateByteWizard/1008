import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'help_screen.dart';
import 'feedback_screen.dart';
import 'user_agreement_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildSettingsGroup(
            context,
            'App Information',
            [
              _buildSettingItem(
                context,
                Icons.info_outline,
                'About Encryptrix',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutScreen())),
              ),
              _buildSettingItem(
                context,
                Icons.help_outline,
                'Help & Support',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelpScreen())),
              ),
              _buildSettingItem(
                context,
                Icons.feedback_outlined,
                'Feedback & Suggestions',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackScreen())),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSettingsGroup(
            context,
            'Legal',
            [
              _buildSettingItem(
                context,
                Icons.description_outlined,
                'User Agreement',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserAgreementScreen())),
              ),
              _buildSettingItem(
                context,
                Icons.privacy_tip_outlined,
                'Privacy Policy',
                () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup(
      BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor, size: 28),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          Icon(Icons.chevron_right, color: Theme.of(context).primaryColor),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    );
  }
}
