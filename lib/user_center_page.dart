import 'package:flutter/material.dart';
import 'package:milaio/about_page.dart';
import 'package:milaio/feedback_page.dart';
import 'package:milaio/help_page.dart';
import 'package:milaio/terms_of_service_page.dart';
import 'package:milaio/privacy_policy_page.dart';

class UserCenterPage extends StatelessWidget {
  const UserCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Center'),
        elevation: 0, // Removes shadow for a cleaner look
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16), // Add some padding at the top
          _buildListTile(
            context,
            'About Milaio',
            Icons.info_outline,
            const AboutPage(),
          ),
          _buildListTile(
            context,
            'Feedback',
            Icons.feedback_outlined,
            const FeedbackPage(),
          ),
          _buildListTile(
            context,
            'Help',
            Icons.help_outline,
            const HelpPage(),
          ),
          _buildListTile(
            context,
            'Terms of Service',
            Icons.description_outlined,
            const TermsOfServicePage(),
          ),
          _buildListTile(
            context,
            'Privacy Policy',
            Icons.privacy_tip_outlined,
            const PrivacyPolicyPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
