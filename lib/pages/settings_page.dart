import 'package:flutter/material.dart';
import 'package:Gleoun/pages/about_app_page.dart';
import 'package:Gleoun/pages/about_us_page.dart';
import 'package:Gleoun/pages/help_feedback_page.dart';
import 'package:Gleoun/pages/privacy_policy_page.dart';
import 'package:Gleoun/pages/update_notes_page.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Settings',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Customize your app experience',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.tips_and_updates_rounded,
                                  color: Theme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.tips_and_updates,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 28,
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                'Settings Guide',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            'Basic Functions:\n'
                                            '• Click any setting item to enter detailed page\n'
                                            '• All settings are saved automatically\n\n'
                                            'User Support:\n'
                                            '• Help & Feedback: Get help or provide suggestions\n'
                                            '• Privacy Policy: Understand data usage policies\n\n'
                                            'About:\n'
                                            '• About App: View app details\n'
                                            '• About Us: Learn about the development team\n'
                                            '• Update Notes: Check latest updates',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  height: 1.6,
                                                  color: Colors.grey[800],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    _buildSettingsCard(
                      context: context,
                      title: 'User Support',
                      items: [
                        SettingsItem(
                          icon: Icons.help_outline,
                          iconColor: Colors.blue,
                          title: 'Help & Feedback',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HelpFeedbackPage()),
                          ),
                        ),
                        SettingsItem(
                          icon: Icons.privacy_tip_outlined,
                          iconColor: Colors.green,
                          title: 'Privacy Policy',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PrivacyPolicyPage()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildSettingsCard(
                      context: context,
                      title: 'About',
                      items: [
                        SettingsItem(
                          icon: Icons.info_outline,
                          iconColor: Colors.purple,
                          title: 'About App',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutAppPage()),
                          ),
                        ),
                        SettingsItem(
                          icon: Icons.people_outline,
                          iconColor: Colors.orange,
                          title: 'About Us',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUsPage()),
                          ),
                        ),
                        SettingsItem(
                          icon: Icons.update,
                          iconColor: Colors.teal,
                          title: 'Update Notes',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateNotesPage()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required BuildContext context,
    required String title,
    required List<SettingsItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) =>
                _buildAnimatedListTile(items[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedListTile(SettingsItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item.iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item.icon,
                  color: item.iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  SettingsItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });
}
