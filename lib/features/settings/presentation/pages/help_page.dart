import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'How to use the app',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Todo List:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('• Tap the + button to add a new todo'),
            Text('• Tap on a todo to view details'),
            Text('• Swipe left or right to delete a todo'),
            Text('• Use the checkbox to mark a todo as complete'),
            SizedBox(height: 16),
            Text(
              'Pomodoro Timer:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('• Set your work and break durations'),
            Text('• Press Start to begin the timer'),
            Text('• Use Pause to temporarily stop the timer'),
            Text('• Press Reset to start over'),
            SizedBox(height: 16),
            Text(
              'Password Manager:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('• Tap the + button to add a new password'),
            Text('• Tap on a password to view details'),
            Text('• Use the edit button to modify a password'),
            Text('• Use the delete button to remove a password'),
            SizedBox(height: 16),
            Text(
              'If you need further assistance, please contact our support team.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}