import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Gleoun'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Company Introduction
          _buildSection(
            theme,
            title: 'Who We Are',
            content:
                '''Gleoun is a pioneering technology company dedicated to revolutionizing social connections through AI-powered innovations. Founded in 2024, we're on a mission to create meaningful digital interactions that bring people closer together.

Our platform combines cutting-edge artificial intelligence with human-centered design to deliver a social experience that's both intelligent and warmly engaging.''',
            icon: Icons.corporate_fare,
          ),

          const SizedBox(height: 24),

          // Our Values
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Core Values',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildVisionItem(
                    icon: Icons.psychology,
                    title: 'Innovation First',
                    description:
                        'Pushing boundaries in AI and social technology to create unprecedented user experiences',
                    theme: theme,
                  ),
                  _buildVisionItem(
                    icon: Icons.diversity_3,
                    title: 'Global Community',
                    description:
                        'Building bridges across cultures and fostering meaningful connections worldwide',
                    theme: theme,
                  ),
                  _buildVisionItem(
                    icon: Icons.verified_user,
                    title: 'Trust & Safety',
                    description:
                        'Ensuring user privacy and security while maintaining transparent practices',
                    theme: theme,
                  ),
                  _buildVisionItem(
                    icon: Icons.accessibility_new,
                    title: 'Inclusive Design',
                    description:
                        'Creating accessible and welcoming spaces for users of all backgrounds',
                    theme: theme,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Contact Information
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get in Touch',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildContactItem(
                    icon: Icons.email,
                    title: 'Email Us',
                    content: 'support@Gleoun.com',
                    theme: theme,
                    isLink: true,
                  ),
                  _buildContactItem(
                    icon: Icons.language,
                    title: 'Website',
                    content: 'www.Gleoun.com',
                    theme: theme,
                    isLink: true,
                  ),
                  _buildContactItem(
                    icon: Icons.location_on,
                    title: 'Headquarters',
                    content:
                        '123 Innovation Drive\nSilicon Valley, CA 94025\nUnited States',
                    theme: theme,
                  ),
                  _buildContactItem(
                    icon: Icons.support_agent,
                    title: 'Support Hours',
                    content: '24/7 Global Support',
                    theme: theme,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Social Links
          _buildSocialLinks(theme),
        ],
      ),
    );
  }

  Widget _buildSection(
    ThemeData theme, {
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: theme.primaryColor),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisionItem({
    required IconData icon,
    required String title,
    required String description,
    required ThemeData theme,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 24,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodySmall?.color,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    required ThemeData theme,
    bool isLink = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 24,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isLink ? theme.primaryColor : null,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks(ThemeData theme) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Follow Us',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialButton(
                  icon: Icons.facebook,
                  label: 'Facebook',
                  theme: theme,
                ),
                _buildSocialButton(
                  icon: Icons.camera_alt,
                  label: 'Instagram',
                  theme: theme,
                ),
                _buildSocialButton(
                  icon: Icons.discord,
                  label: 'Discord',
                  theme: theme,
                ),
                _buildSocialButton(
                  icon: Icons.android,
                  label: 'LinkedIn',
                  theme: theme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required ThemeData theme,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: theme.primaryColor),
          onPressed: () {
            // TODO: Implement social media links
          },
          style: IconButton.styleFrom(
            backgroundColor: theme.primaryColor.withOpacity(0.1),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
