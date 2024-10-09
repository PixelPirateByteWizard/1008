import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Encryptrix'),
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildInfoSection(context),
            _buildFeaturesList(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade700, Colors.blue.shade500],
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.security, size: 80, color: Colors.white),
          const SizedBox(height: 16),
          const Text(
            'Encryptrix',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          const Text(
            'Protect Your Digital Life',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem(Icons.info_outline, 'Version', '1.0.0'),
            _buildInfoItem(Icons.update, 'Last Updated', 'May 1, 2023'),
            _buildInfoItem(
                Icons.language, 'Supported Languages', 'English, 简体中文'),
            const SizedBox(height: 16),
            Text(
              'Encryptrix is a comprehensive security tool designed to protect your digital life. It integrates password generation, data encryption, and QR code creation functionalities, allowing you to easily manage your personal information security. Whether you\'re a casual user or a security expert, Encryptrix caters to your needs with its user-friendly interface, helping you stay safe online and protect your privacy.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(content)),
        ],
      ),
    );
  }

  Widget _buildFeaturesList() {
    final features = [
      'Password Generation',
      'Data Encryption',
      'QR Code Creation',
      'Secure Notes',
      'File Encryption',
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Key Features',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...features.map((feature) => ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green.shade600),
                title: Text(feature),
              )),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                '© 2023 Encryptrix Team. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFooterButton('Privacy Policy',
                      () => _showInfo(context, 'Privacy Policy')),
                  _buildFooterButton('Terms of Service',
                      () => _showInfo(context, 'Terms of Service')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  void _showInfo(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content:
              Text('Detailed information about $title will be displayed here.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
