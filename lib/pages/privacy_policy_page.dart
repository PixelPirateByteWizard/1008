import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        elevation: 0,
      ),
      body: const PrivacyPolicyContent(),
    );
  }
}

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const _HeaderSection(title: 'Securoli Privacy Policy'),
        const SizedBox(height: 24),
        _buildPolicySection(
          title: '1. Information Collection',
          content: 'We only collect necessary information to provide our services, such as your encrypted data and password management information. This information is stored on your device, and we do not transmit or store it on our servers.',
        ),
        _buildPolicySection(
          title: '2. Information Usage',
          content: 'We only use the collected information to provide and improve our services. We do not sell, rent, or share your information with third parties.',
        ),
        _buildPolicySection(
          title: '3. Information Protection',
          content: 'We take appropriate technical and organizational measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction.',
        ),
        _buildPolicySection(
          title: '4. User Rights',
          content: 'You have the right to access, correct, or delete your personal information. If you wish to exercise these rights, please contact us through the app settings or our support team.',
        ),
        _buildPolicySection(
          title: '5. Policy Updates',
          content: 'We may update this privacy policy from time to time. We will notify you of any significant changes within the app and obtain your consent (if applicable).',
        ),
        const SizedBox(height: 24),
        const _ContactSection(),
      ],
    );
  }

  Widget _buildPolicySection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
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

class _HeaderSection extends StatelessWidget {
  final String title;

  const _HeaderSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'This privacy policy describes how we collect, use, and protect your personal information. By using our app, you agree to the terms of this privacy policy.',
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'If you have any questions or suggestions about our privacy policy, please feel free to contact us:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // TODO: Implement email functionality
              },
              child: const Text('support@securoli.com'),
            ),
          ],
        ),
      ),
    );
  }
}