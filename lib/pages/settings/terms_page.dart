import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: '1. Acceptance of Terms',
            content:
                'By accessing and using this application, you accept and agree to be bound by the terms and provision of this agreement.',
          ),
          _buildSection(
            title: '2. Use License',
            content:
                'Permission is granted to temporarily download one copy of the app for personal, non-commercial transitory viewing only.',
          ),
          _buildSection(
            title: '3. Disclaimer',
            content:
                'The materials on the app are provided on an \'as is\' basis. We make no warranties, expressed or implied, and hereby disclaim and negate all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
          ),
          _buildSection(
            title: '4. Limitations',
            content:
                'In no event shall we or our suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on the app.',
          ),
          _buildSection(
            title: '5. Revisions',
            content:
                'We may revise these terms of service for the app at any time without notice. By using this app you are agreeing to be bound by the then current version of these terms of service.',
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
