import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Privacy & Security',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const _HeaderSection(),
          const SizedBox(height: 24),
          _buildPrivacySection(
            context,
            title: 'Data Collection',
            content:
                'We collect essential data to provide you with the best possible experience:\n\n'
                '• Account Information: Basic profile details and preferences\n'
                '• Usage Data: Interaction patterns and feature usage\n'
                '• Device Information: Technical details for optimization\n'
                '• Content Data: Your shared earring combinations and interactions',
            icon: Icons.data_usage,
            color: const Color(0xFF3498DB),
          ),
          const SizedBox(height: 20),
          _buildPrivacySection(
            context,
            title: 'How We Use Your Data',
            content: 'Your data helps us create a better platform:\n\n'
                '• Personalization: Tailored recommendations and content\n'
                '• Service Improvement: Enhanced features and functionality\n'
                '• Community Safety: Maintaining a secure environment\n'
                '• Communication: Important updates and notifications',
            icon: Icons.security,
            color: const Color(0xFF2ECC71),
          ),
          const SizedBox(height: 20),
          _buildPrivacySection(
            context,
            title: 'Data Protection',
            content: 'Your security is our top priority:\n\n'
                '• End-to-End Encryption: Secure data transmission\n'
                '• Regular Security Audits: Continuous monitoring\n'
                '• Access Controls: Strict data access policies\n'
                '• Compliance: Following international privacy standards',
            icon: Icons.shield,
            color: const Color(0xFFE67E22),
          ),
          const SizedBox(height: 20),
          _buildPrivacySection(
            context,
            title: 'Your Privacy Rights',
            content: 'You have complete control over your data:\n\n'
                '• Access: View your personal information anytime\n'
                '• Modification: Update or correct your data\n'
                '• Deletion: Request data removal\n'
                '• Export: Download your data in a readable format',
            icon: Icons.admin_panel_settings,
            color: const Color(0xFF9B59B6),
          ),
          const SizedBox(height: 24),
          _buildContactSection(context),
        ],
      ),
    );
  }

  Widget _buildPrivacySection(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withOpacity(0.06),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF7F8C8D),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Privacy Matters',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'We are committed to protecting your privacy and ensuring the security of your personal information.',
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF7F8C8D).withOpacity(0.8),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

Widget _buildContactSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF3498DB).withOpacity(0.1),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF3498DB).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.contact_support_outlined,
                color: Color(0xFF3498DB),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Need Support?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Our dedicated privacy team is here to help:\n\n'
          '• Email: privacy@Ember.com\n'
          '• Response Time: Within 24 hours\n'
          '• Available: Monday to Friday\n'
          '• Languages: English, Chinese',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF7F8C8D),
            height: 1.6,
          ),
        ),
      ],
    ),
  );
}
