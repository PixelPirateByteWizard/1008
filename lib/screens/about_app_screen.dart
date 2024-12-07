import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Famigoletix'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // App Logo and Version
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Icon(Icons.home, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            'Famigoletix',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Version 1.0.0',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // App Description
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Your Complete Family Management Solution',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          // Core Features Section
          Text(
            'Core Features',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),

          _buildFeatureCard(
            icon: Icons.shopping_cart,
            title: 'Smart Shopping List',
            description:
                'Create categorized shopping lists, set priorities, and share with family members. Track expenses and favorite items for quick access.',
            color: Colors.green,
          ),

          _buildFeatureCard(
            icon: Icons.pets,
            title: 'Comprehensive Pet Care',
            description:
                'Track pet meals, medications, vet appointments, and exercise routines. Set reminders for vaccinations and maintain digital health records.',
            color: Colors.orange,
          ),

          _buildFeatureCard(
            icon: Icons.task,
            title: 'Family Task Management',
            description:
                'Organize household tasks, schedule maintenance, and coordinate family responsibilities. Set recurring tasks and track completion status.',
            color: Colors.purple,
          ),

          const SizedBox(height: 24),

          // Additional Features Section
          _buildAdditionalFeatures(context),

          const SizedBox(height: 24),

          // Contact & Support
          _buildSupportSection(context),

          const SizedBox(height: 24),

          // Copyright
          Text(
            '© 2024 Famigoletix. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalFeatures(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Features',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        _buildFeatureRow(Icons.sync, 'Real-time Sync Across Devices'),
        _buildFeatureRow(Icons.notifications, 'Smart Reminders'),
        _buildFeatureRow(Icons.group, 'Family Member Profiles'),
        _buildFeatureRow(Icons.analytics, 'Activity Reports'),
        _buildFeatureRow(Icons.security, 'Secure Data Storage'),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Need Help?',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Contact our support team for assistance',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              // Add support contact action
            },
            child: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }
}
