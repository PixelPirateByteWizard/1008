import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Last updated: [2024-07-20]',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '1. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We collect information that you provide directly to us when using the app, including:'),
            Text('• Todo list items'),
            Text('• Pomodoro timer settings'),
            Text('• Passwords (encrypted)'),
            SizedBox(height: 16),
            Text(
              '2. How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We use the information we collect to:'),
            Text('• Provide, maintain, and improve our services'),
            Text('• Respond to your comments, questions, and requests'),
            Text('• Detect, investigate, and prevent fraudulent transactions and other illegal activities'),
            SizedBox(height: 16),
            Text(
              '3. Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We implement appropriate technical and organizational measures to protect the security of your personal information.'),
            SizedBox(height: 16),
            Text(
              '4. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.'),
            SizedBox(height: 16),
            Text(
              '5. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('If you have any questions about this Privacy Policy, please contact us at: privacy@example.com'),
          ],
        ),
      ),
    );
  }
}