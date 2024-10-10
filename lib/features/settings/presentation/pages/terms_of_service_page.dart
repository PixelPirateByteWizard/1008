import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Terms of Service',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Last updated: [2024-07-20]',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Please read these Terms of Service carefully before using our mobile application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('By accessing or using the app, you agree to be bound by these Terms of Service.'),
            SizedBox(height: 16),
            Text(
              '2. Use of the App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('You agree to use the app only for lawful purposes and in accordance with these Terms of Service.'),
            SizedBox(height: 16),
            Text(
              '3. User Accounts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('You are responsible for maintaining the confidentiality of your account and password.'),
            SizedBox(height: 16),
            Text(
              '4. Intellectual Property',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('The app and its original content, features, and functionality are owned by us and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.'),
            SizedBox(height: 16),
            Text(
              '5. Termination',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We may terminate or suspend your account and bar access to the app immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation.'),
            SizedBox(height: 16),
            Text(
              '6. Limitation of Liability',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('In no event shall we be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.'),
            SizedBox(height: 16),
            Text(
              '7. Changes to Terms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('We reserve the right to modify or replace these Terms at any time. It is your responsibility to check the Terms periodically for changes.'),
            SizedBox(height: 16),
            Text(
              '8. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('If you have any questions about these Terms, please contact us at: terms@example.com'),
          ],
        ),
      ),
    );
  }
}