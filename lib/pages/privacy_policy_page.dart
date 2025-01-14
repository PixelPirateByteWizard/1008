import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Privacy Policy',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.8),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildMainCard(context),
            const SizedBox(height: 16),
            _buildUpdateCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.security_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              context: context,
              title: '1. Information We Collect',
              content: 'We collect the following types of information:\n\n'
                  '• Personal Information: Name, email address, and profile data\n'
                  '• Device Information: Device model, operating system version, and unique device identifiers\n'
                  '• Usage Data: App interaction patterns, feature usage statistics, and performance metrics\n'
                  '• Communication Data: Chat messages and interaction history with AI experts',
            ),
            _buildSection(
              context: context,
              title: '2. Information Use',
              content: 'We collect information to:\n\n'
                  '• Provide and improve services\n'
                  '• Personalize user experience\n'
                  '• Send service notifications',
            ),
            _buildSection(
              context: context,
              title: '3. Information Protection',
              content:
                  'We take multiple measures to protect your information:\n\n'
                  '• Data encryption storage\n'
                  '• Access permission control\n'
                  '• Regular security audits',
            ),
            _buildSection(
              context: context,
              title: '4. Information Sharing',
              content:
                  'We will not sell, rent, or share your personal information with third parties, unless:\n\n'
                  '• You have given explicit consent\n'
                  '• Legal requirements',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                  color: Colors.grey[800],
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.update_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Last Updated',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'January 1, 2024',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
