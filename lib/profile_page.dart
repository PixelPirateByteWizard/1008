import 'package:flutter/material.dart';
import 'about_page.dart';
import 'help_page.dart';
import 'feedback_page.dart';
import 'user_agreement_page.dart';
import 'privacy_policy_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('个人中心', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildSectionTitle('设置'),
          _buildListTile(
              context, Icons.info_outline, '关于App', const AboutPage()),
          _buildListTile(context, Icons.help_outline, '使用帮助', const HelpPage()),
          _buildListTile(
              context, Icons.feedback_outlined, '反馈与建议', const FeedbackPage()),
          const SizedBox(height: 20),
          _buildSectionTitle('法律'),
          _buildListTile(context, Icons.description_outlined, '用户协议',
              const UserAgreementPage()),
          _buildListTile(context, Icons.privacy_tip_outlined, '隐私协议',
              const PrivacyPolicyPage()),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
