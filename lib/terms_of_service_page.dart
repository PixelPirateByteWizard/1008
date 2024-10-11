import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms of Service',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Welcome to Milaio',
              'By using our services, you agree to these terms. Please read them carefully.',
            ),
            _buildSection(
              '1. Service Description',
              'Milaio provides a platform for [brief description of your app\'s main features]. Our services are designed to [main purpose or benefit for users].',
            ),
            _buildSection(
              '2. User Responsibilities',
              'Users are responsible for maintaining the confidentiality of their account information and for all activities that occur under their account. Users must not use the service for any illegal or unauthorized purpose.',
            ),
            _buildSection(
              '3. Privacy Protection',
              'We take your privacy seriously. Our Privacy Policy, which is part of these Terms, describes how we collect, use, and protect your personal information.',
            ),
            _buildSection(
              '4. Intellectual Property',
              'All content and materials available on Milaio, including but not limited to text, graphics, website name, code, images and logos are the intellectual property of Milaio and are protected by applicable copyright and trademark law.',
            ),
            _buildSection(
              '5. Disclaimer',
              'Milaio services are provided "as is" without any warranties, expressed or implied. We do not guarantee that our services will always be safe, secure or error-free.',
            ),
            _buildSection(
              '6. Modifications to Terms',
              'We may modify these terms or any additional terms that apply to a Service to, for example, reflect changes to the law or changes to our Services.',
            ),
            _buildSection(
              '7. Governing Law',
              'These terms and conditions are governed by and construed in accordance with the laws of [Your Country/State] and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.',
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement acceptance logic
                  Navigator.of(context).pop();
                },
                child: const Text('I Accept'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
