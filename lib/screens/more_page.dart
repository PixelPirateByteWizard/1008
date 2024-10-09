import 'package:flutter/material.dart';
import 'about_app_page.dart';
import 'help_page.dart';
import 'feedback_page.dart';
import 'user_agreement_page.dart';
import 'privacy_policy_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:
            const Text('More', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildListTile(
                context, 'About App', const AboutAppPage(), Icons.info_outline),
            _buildListTile(
                context, 'Help', const HelpPage(), Icons.help_outline),
            _buildListTile(context, 'Feedback & Suggestions',
                const FeedbackPage(), Icons.feedback_outlined),
            _buildListTile(context, 'User Agreement', const UserAgreementPage(),
                Icons.description_outlined),
            _buildListTile(context, 'Privacy Policy', PrivacyPolicyPage(),
                Icons.lock_outline),
          ],
        ),
      ),
    );
  }

  Card _buildListTile(
      BuildContext context, String title, Widget page, IconData leadingIcon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: ListTile(
        leading: Icon(leadingIcon, color: Colors.blueAccent),
        title: Text(title,
            style:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
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
