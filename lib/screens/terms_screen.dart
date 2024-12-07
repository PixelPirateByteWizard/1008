import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Terms of Service',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Last updated: March 15, 2024',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            theme,
            title: '1. Acceptance of Terms',
            content:
                'By accessing and using Famigoletix, you accept and agree to be bound by the terms and provisions of this agreement. These terms apply to all users of the application, including shopping list management, pet care tracking, and household task management features.',
          ),
          _buildSection(
            theme,
            title: '2. Service Description',
            content:
                'Famigoletix provides digital tools for household management, including but not limited to:\n\n'
                '• Shopping list creation and management\n'
                '• Pet care tracking (feeding schedules, health checks, vaccinations, daily care)\n'
                '• Household task management (cleaning, maintenance, repairs)\n\n'
                'These services are provided "as is" and may be updated or modified periodically.',
          ),
          _buildSection(
            theme,
            title: '3. User Responsibilities',
            content: 'Users are responsible for:\n\n'
                '• Maintaining the confidentiality of their account information\n'
                '• Ensuring the accuracy of pet care and household management data\n'
                '• Using the service in compliance with local laws and regulations\n'
                '• Respecting the privacy and rights of other users',
          ),
          _buildSection(
            theme,
            title: '4. Data Privacy',
            content:
                'We prioritize the protection of your personal information and household data. Your shopping lists, pet care records, and household task information are stored securely and handled in accordance with our Privacy Policy.',
          ),
          _buildSection(
            theme,
            title: '5. Limitations',
            content:
                'Famigoletix is not a substitute for professional veterinary care or household maintenance services. Users should consult qualified professionals for medical advice regarding pets or technical assistance for home repairs.',
          ),
          _buildSection(
            theme,
            title: '6. Termination',
            content:
                'We reserve the right to terminate or suspend access to our service immediately, without prior notice, for conduct that we believe violates these terms or is harmful to other users, our systems, or third parties.',
          ),
          const SizedBox(height: 32),
          Text(
            'Contact Us',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'If you have any questions about these Terms, please contact us at support@famigoletix.com',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection(
    ThemeData theme, {
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
