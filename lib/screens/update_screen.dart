import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Version History',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCurrentVersion(context),
            const SizedBox(height: 32),
            Text(
              'Release Notes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFF2C3E50),
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Track our journey of continuous improvements',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF7F8C8D),
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _buildUpdateHistory(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentVersion(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3498DB), Color(0xFF2980B9)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.verified_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Current Version',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'v1.2.0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Latest Release',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateHistory(BuildContext context) {
    return ListView.separated(
      itemCount: updateHistory.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final update = updateHistory[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A1A1A).withOpacity(0.06),
                offset: const Offset(0, 2),
                blurRadius: 8,
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
                    Text(
                      update.version,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECF0F1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        update.date,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7F8C8D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...update.changes.map(
                  (change) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.arrow_right,
                          color: Color(0xFF3498DB),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            change,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF2C3E50),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UpdateInfo {
  final String version;
  final String date;
  final List<String> changes;

  const UpdateInfo({
    required this.version,
    required this.date,
    required this.changes,
  });
}

final List<UpdateInfo> updateHistory = [
  UpdateInfo(
    version: 'v1.2.0',
    date: 'March 15, 2024',
    changes: [
      'Introduced multi-character AI conversations for more dynamic interactions',
      'Added customizable AI personality settings for personalized experience',
      'Enhanced chat interface with improved responsiveness and animations',
      'Optimized AI response time for faster interactions',
      'Implemented new theme customization options',
    ],
  ),
  UpdateInfo(
    version: 'v1.1.0',
    date: 'February 20, 2024',
    changes: [
      'Launched voice input capability with multiple language support',
      'Integrated advanced image generation with customizable styles',
      'Redesigned user interface for better accessibility',
      'Added dark mode support for comfortable nighttime usage',
      'Improved error handling and network stability',
    ],
  ),
  UpdateInfo(
    version: 'v1.0.0',
    date: 'January 10, 2024',
    changes: [
      'Initial release with core conversation features',
      'Multiple theme support for personalized experience',
      'Basic AI character interactions and responses',
      'Implemented secure user authentication system',
      'Foundation for future feature expansions',
    ],
  ),
];
