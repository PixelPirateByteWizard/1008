import 'package:flutter/material.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Agreement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderText('Securoli User Agreement'),
              const SizedBox(height: 16),
              _buildParagraph('Welcome to Securoli. By using this application, you agree to comply with the following terms and conditions:'),
              const SizedBox(height: 24),
              _buildSection('1. Service Description', [
                'This application provides encryption, password management, and QR code generation services. We reserve the right to modify, suspend, or terminate the service at any time.',
                'User data security is our top priority. We use advanced encryption technology to protect your information.',
              ]),
              _buildSection('2. User Responsibilities', [
                'You agree not to use this application for any illegal or unauthorized purposes.',
                'You are responsible for all activities that occur under your account.',
                'Please keep your account information secure and do not share it with others.',
              ]),
              _buildSection('3. Intellectual Property', [
                'This application and its content are protected by copyright and other intellectual property laws.',
                'You may not copy, modify, distribute, or sell any part of this application without our explicit permission.',
              ]),
              _buildSection('4. Privacy Policy', [
                'Securoli values user privacy. Our privacy policy details how we collect and use personal information.',
                'By using this application, you agree to our privacy policy.',
              ]),
              _buildSection('5. Disclaimer', [
                'While we strive to ensure the reliability and security of our service, we are not liable for any losses resulting from the use of this application.',
                'Users assume all risks associated with using this application.',
              ]),
              const SizedBox(height: 24),
              _buildParagraph('If you have any questions about this agreement, please contact our customer support team.'),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('I have read and agree'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> paragraphs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title),
        const SizedBox(height: 8),
        ...paragraphs.map((p) => _buildParagraph(p)),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;

  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}