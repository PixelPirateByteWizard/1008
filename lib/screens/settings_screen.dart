import 'package:flutter/material.dart';
import 'about_app_screen.dart';
import 'help_screen.dart';
import 'terms_screen.dart';
import 'privacy_policy_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildSection(
              context,
              title: 'Account & Support',
              items: [
                _SettingsItem(
                  icon: Icons.help_outline_rounded,
                  iconColor: Colors.blue,
                  title: 'Help Center',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()),
                  ),
                ),
                _SettingsItem(
                  icon: Icons.feedback_outlined,
                  iconColor: Colors.orange,
                  title: 'Send Feedback',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackScreen()),
                  ),
                ),
              ],
            ),
            _buildSection(
              context,
              title: 'About',
              items: [
                _SettingsItem(
                  icon: Icons.info_outline_rounded,
                  iconColor: Colors.green,
                  title: 'About App',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutAppScreen()),
                  ),
                ),
              ],
            ),
            _buildSection(
              context,
              title: 'Legal',
              items: [
                _SettingsItem(
                  icon: Icons.description_outlined,
                  iconColor: Colors.purple,
                  title: 'Terms of Service',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsOfServiceScreen()),
                  ),
                ),
                _SettingsItem(
                  icon: Icons.privacy_tip_outlined,
                  iconColor: Colors.red,
                  title: 'Privacy Policy',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<_SettingsItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  if (index != 0)
                    const Divider(height: 1, indent: 56, endIndent: 16),
                  item,
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[400],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
