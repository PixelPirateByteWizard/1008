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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildSection(
              'At Milaio, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data.',
            ),
            const SizedBox(height: 24),
            _buildPolicySection(
              '1. Information Collection',
              'We collect information you provide directly to us, such as when you create an account, use our services, or contact our support team. This may include your name, email address, and usage data.',
            ),
            _buildPolicySection(
              '2. Information Usage',
              'We use your information to provide, maintain, and improve our services, as well as to communicate with you about updates, offers, and support.',
            ),
            _buildPolicySection(
              '3. Information Sharing',
              'We do not sell your personal information. We may share your data with third-party service providers who assist us in operating our business, but only as necessary to provide our services.',
            ),
            _buildPolicySection(
              '4. Data Security',
              'We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
            ),
            _buildPolicySection(
              '5. Your Rights',
              'You have the right to access, correct, or delete your personal information. You can also object to or restrict certain processing of your data.',
            ),
            _buildPolicySection(
              '6. Children\'s Privacy',
              'Our services are not intended for children under 13. We do not knowingly collect personal information from children under 13.',
            ),
            _buildPolicySection(
              '7. Policy Updates',
              'We may update this Privacy Policy from time to time. We will notify you of any significant changes by posting the new policy on this page.',
            ),
            const SizedBox(height: 24),
            _buildContactSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, height: 1.5),
    );
  }

  Widget _buildPolicySection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Questions or Concerns?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'If you have any questions about our Privacy Policy, please contact us:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
