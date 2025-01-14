import 'package:flutter/material.dart';

class UpdateNotesPage extends StatelessWidget {
  const UpdateNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Release Notes'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Current Version
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'CURRENT VERSION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'v2.0.0',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildUpdateNote(
                    version: '2.0.0',
                    date: 'March 15, 2024',
                    changes: [
                      'Introducing AI-powered Smart Replies for faster conversations',
                      'New Dark Mode support for better night-time viewing',
                      'Enhanced video chat with background blur and effects',
                      'Improved community features with topic categorization',
                      'Added support for multiple language translations',
                    ],
                    theme: theme,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Previous Versions
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Previous Versions',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildUpdateNote(
                    version: '1.9.0',
                    date: 'March 1, 2024',
                    changes: [
                      'Redesigned user interface for better accessibility',
                      'Added customizable notification preferences',
                      'Improved image compression for faster loading',
                      'Enhanced search functionality with filters',
                    ],
                    theme: theme,
                  ),
                  const Divider(height: 32),
                  _buildUpdateNote(
                    version: '1.8.0',
                    date: 'February 15, 2024',
                    changes: [
                      'Introduced group chat features with up to 100 participants',
                      'Added support for file sharing up to 100MB',
                      'New emoji reactions for messages and posts',
                      'Improved performance and reduced battery consumption',
                    ],
                    theme: theme,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateNote({
    required String version,
    required String date,
    required List<String> changes,
    required ThemeData theme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              version,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              date,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...changes.map((change) => Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.primaryColor,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      change,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
