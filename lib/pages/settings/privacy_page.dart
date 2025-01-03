import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            icon: Icons.security,
            title: 'Information Collection',
            content:
                'We collect minimal personal information necessary for app functionality. This includes device information and usage statistics.',
          ),
          _buildSection(
            icon: Icons.storage,
            title: 'Data Storage',
            content:
                'All notes and QR codes are stored locally on your device. We do not upload or store your data on external servers.',
          ),
          _buildSection(
            icon: Icons.share,
            title: 'Information Sharing',
            content:
                'We do not share your personal information with third parties. Your data remains private and secure.',
          ),
          _buildSection(
            icon: Icons.camera,
            title: 'Camera Usage',
            content:
                'Camera access is required only for QR code scanning. We do not store or transmit camera data.',
          ),
          _buildSection(
            icon: Icons.update,
            title: 'Policy Updates',
            content:
                'We may update this privacy policy from time to time. Check back regularly for any changes.',
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
