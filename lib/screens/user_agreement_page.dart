import 'package:flutter/material.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'User Agreement',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PrioritEase User Agreement',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              '1. Acceptance of Terms',
              'By using the PrioritEase application, you agree to comply with all the terms and conditions outlined in this User Agreement. If you do not agree to these terms, please do not use this application.',
            ),
            _buildSection(
              '2. Description of Service',
              'PrioritEase is a task management and productivity tool designed to help users organize and prioritize their tasks. We reserve the right to modify, suspend, or discontinue the service at any time without prior notice.',
            ),
            _buildSection(
              '3. User Responsibilities',
              'You agree to keep your account and password confidential and are responsible for all activities conducted through your account. You agree not to transfer your account to any other person.',
            ),
            _buildSection(
              '4. Content Ownership',
              'You retain all ownership rights to the content you create within PrioritEase. You grant us a non-exclusive, worldwide, royalty-free license to use, reproduce, and display your content solely to provide the service.',
            ),
            _buildSection(
              '5. Privacy Policy',
              'We value your privacy. Please review our Privacy Policy to understand how we collect, use, and protect your personal information.',
            ),
            _buildSection(
              '6. Disclaimer of Warranties',
              'PrioritEase is provided "as is" without any express or implied warranties. We do not guarantee that the service will be uninterrupted, timely, secure, or error-free.',
            ),
            _buildSection(
              '7. Limitation of Liability',
              'Under no circumstances shall PrioritEase or its officers, directors, employees, or agents be liable for any indirect, incidental, special, consequential, or punitive damages.',
            ),
            _buildSection(
              '8. Amendments',
              'We reserve the right to amend this User Agreement at any time. The amended agreement will be posted in the PrioritEase application. Continued use of the application constitutes your acceptance of the amended terms.',
            ),
            _buildSection(
              '9. Governing Law',
              'This User Agreement shall be governed by and construed in accordance with the laws of the People’s Republic of China.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
