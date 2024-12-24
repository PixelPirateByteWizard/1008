import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App Logo and Name Section
            Container(
              color: AppTheme.primaryColor,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/app_logo.png'),
                    // Add your app logo image here
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Urban Love Life',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Version 1.0.0',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // App Description Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('About'),
                  const SizedBox(height: 12),
                  const Text(
                    'Urban Love Life is an immersive text adventure game where you navigate through the complexities of modern romance and career choices. Make meaningful decisions that shape your character\'s journey through love, work, and life.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Features'),
                  const SizedBox(height: 12),
                  _buildFeatureItem('Multiple storylines and endings'),
                  _buildFeatureItem('Character customization'),
                  _buildFeatureItem('Meaningful choices'),
                  _buildFeatureItem('Regular content updates'),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Connect With Us'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSocialButton(
                        icon: Icons.language,
                        label: 'Website',
                        onTap: () {
                          // Add website URL launch
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.mail_outline,
                        label: 'Contact',
                        onTap: () {
                          // Add email launch
                        },
                      ),
                      _buildSocialButton(
                        icon: Icons.star_border,
                        label: 'Rate Us',
                        onTap: () {
                          // Add store rating launch
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryColor,
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppTheme.primaryColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
