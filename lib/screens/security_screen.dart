import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Security & Privacy',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Security',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                      height: 1.2,
                    ),
                  ),
                  const Text(
                    'Is Our Priority',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'We implement industry-leading security measures to protect your data and privacy',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7F8C8D),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSecurityCard(
                  context,
                  title: 'End-to-End Encryption',
                  description:
                      'Your data is encrypted using AES-256 encryption standard. Only you can access your sensitive information.',
                  icon: Icons.lock_rounded,
                  color: const Color(0xFF3498DB),
                  features: const [
                    'Military-grade encryption',
                    'Secure key management',
                    'Zero-knowledge architecture'
                  ],
                ),
                const SizedBox(height: 16),
                _buildSecurityCard(
                  context,
                  title: 'Biometric Authentication',
                  description:
                      'Access your account securely using your device\'s built-in biometric features.',
                  icon: Icons.fingerprint,
                  color: const Color(0xFF2ECC71),
                  features: const [
                    'Fingerprint recognition',
                    'Face ID support',
                    'Device-based security'
                  ],
                ),
                const SizedBox(height: 16),
                _buildSecurityCard(
                  context,
                  title: 'Privacy Protection',
                  description:
                      'We follow strict privacy guidelines and give you complete control over your data.',
                  icon: Icons.security,
                  color: const Color(0xFFE67E22),
                  features: const [
                    'GDPR compliance',
                    'Data anonymization',
                    'Customizable privacy settings'
                  ],
                ),
                const SizedBox(height: 16),
                _buildSecurityCard(
                  context,
                  title: 'Secure Cloud Storage',
                  description:
                      'Your earring designs and personal data are safely stored in secure cloud infrastructure.',
                  icon: Icons.cloud_done,
                  color: const Color(0xFF9B59B6),
                  features: const [
                    'Regular backups',
                    'Distributed storage',
                    'Disaster recovery'
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required List<String> features,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF7F8C8D),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: color,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        feature,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF34495E),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
