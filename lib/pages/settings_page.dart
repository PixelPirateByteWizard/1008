import 'package:flutter/material.dart';
import 'about_app_page.dart';
import 'help_page.dart';
import 'feedback_page.dart';
import 'privacy_policy_page.dart';
import 'user_agreement_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('App Information'),
          _buildCard([
            _buildListTile(
              icon: Icons.info,
              title: 'About App',
              onTap: () => _navigateTo(context, const AboutAppPage()),
            ),
            _buildListTile(
              icon: Icons.help,
              title: 'Help',
              onTap: () => _navigateTo(context, const HelpPage()),
            ),
            _buildListTile(
              icon: Icons.feedback,
              title: 'Feedback',
              onTap: () => _navigateTo(context, const FeedbackPage()),
            ),
          ]),
          const SizedBox(height: 16),
          _buildSectionTitle('Legal'),
          _buildCard([
            _buildListTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              onTap: () => _navigateTo(context, const PrivacyPolicyPage()),
            ),
            _buildListTile(
              icon: Icons.description,
              title: 'User Agreement',
              onTap: () => _navigateTo(context, const UserAgreementPage()),
            ),
          ]),
          const SizedBox(height: 24),
          _buildVersionInfo(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(children: children),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Widget _buildVersionInfo() {
    return const Center(
      child: Text(
        'Version 1.0.0', // Replace with your actual version number
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}