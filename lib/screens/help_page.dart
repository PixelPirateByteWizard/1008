import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHelpSection(
            'How to Add a New Task',
            '1. Tap the "+" button at the bottom right of the main screen.\n2. Fill in the task title, description, and due date.\n3. Select the priority level for the task.\n4. Tap the "Save" button to add the task.',
          ),
          _buildHelpSection(
            'How to Edit a Task',
            '1. Long press on the task you wish to edit from the task list.\n2. Select "Edit" from the popup menu.\n3. Modify the task details.\n4. Tap the "Save" button to save changes.',
          ),
          _buildHelpSection(
            'How to Delete a Task',
            '1. Swipe left on the task you want to delete.\n2. Tap the "Delete" button that appears.\nOr:\n1. Long press on the task.\n2. Select "Delete" from the popup menu.',
          ),
          _buildHelpSection(
            'How to View Statistics',
            '1. Tap on the "Statistics" option in the bottom navigation bar.\n2. View your productivity analysis and task completion overview.',
          ),
          _buildHelpSection(
            'How to Set Reminders',
            '1. When creating or editing a task, toggle the "Reminder" option on.\n2. Select the desired reminder time.\n3. Save the task to schedule the reminder.',
          ),
          const SizedBox(height: 16),
          const Text(
            'If you have any other questions, feel free to reach out to our customer support team.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
