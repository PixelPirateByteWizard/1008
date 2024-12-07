import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const _PolicyHeader(),
          const SizedBox(height: 32),
          _PolicySection(
            title: 'Information We Collect',
            content: '''
• Shopping Lists: Items, quantities, and shopping preferences
• Pet Care Information: Pet profiles, feeding schedules, vaccination records, and health checkups
• Household Management: Cleaning schedules, maintenance records, and family task assignments
• User Account Information: Email address and profile settings
• Device Information: Device type, operating system, and app version''',
          ),
          const SizedBox(height: 24),
          _PolicySection(
            title: 'How We Use Your Information',
            content: '''
• To provide and maintain our core services
• To enable cloud synchronization of your data across devices
• To improve and personalize your app experience
• To send important notifications about your pets and household tasks
• To provide technical support and respond to your inquiries''',
          ),
          const SizedBox(height: 24),
          _PolicySection(
            title: 'Data Storage and Security',
            content: '''
Your data is primarily stored locally on your device. When cloud backup is enabled:
• All data is encrypted during transmission
• We use industry-standard security measures
• Your pet care records and shopping lists are backed up securely
• You can delete your data at any time through app settings''',
          ),
          const SizedBox(height: 24),
          _PolicySection(
            title: 'Your Rights and Controls',
            content: '''
You have the right to:
• Access your personal data
• Correct inaccurate data
• Delete your account and associated data
• Export your data
• Opt-out of optional features
• Control app permissions''',
          ),
          const SizedBox(height: 24),
          _PolicySection(
            title: 'Contact Us',
            content:
                'If you have any questions about this Privacy Policy, please contact us at:\nsupport@famigoletix.com',
          ),
          const SizedBox(height: 32),
          const Center(
            child: Text(
              'Famigoletix © 2024. All rights reserved.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PolicyHeader extends StatelessWidget {
  const _PolicyHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Privacy Policy',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            'Last updated: January 1, 2024',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const _PolicySection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          child: Text(
            content,
            style: const TextStyle(
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
