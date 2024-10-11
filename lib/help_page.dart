import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Frequently Asked Questions'),
          const SizedBox(height: 16),
          _buildFAQItem(
            'How do I add a new health record?',
            'To add a new health record:\n\n'
                '1. Tap the "+" button on the main screen.\n'
                '2. Choose the type of health data you want to add.\n'
                '3. Fill in the relevant information.\n'
                '4. Tap "Save" to store your new record.',
          ),
          _buildFAQItem(
            'How can I view my historical data?',
            'To view your historical health data:\n\n'
                '1. On the main screen, select the health data type you want to review.\n'
                '2. Tap the "View History" button.\n'
                '3. You\'ll see a detailed list of your past records, which you can scroll through or filter as needed.',
          ),
          _buildFAQItem(
            'Can I set reminders for health tasks?',
            'Yes, you can set reminders for various health tasks:\n\n'
                '1. Go to the "Health Tools" section.\n'
                '2. Select "Reminders" from the list.\n'
                '3. Tap "Add New Reminder" and fill in the details.\n'
                '4. Choose the frequency and time for your reminder.\n'
                '5. Save your new reminder, and you\'ll receive notifications as scheduled.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement contact support functionality
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Support contact feature coming soon!')),
        );
      },
      icon: const Icon(Icons.email),
      label: const Text('Contact Support'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
    );
  }
}
