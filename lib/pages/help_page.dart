import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHelpSection(
            context,
            'How to use encryption?',
            [
              '1. Select "Encrypt" on the main page',
              '2. Enter the text to encrypt',
              '3. Choose the encryption method',
              '4. Click the "Encrypt" button',
              '5. Copy the encrypted text',
            ],
            Icons.lock,
          ),
          const SizedBox(height: 16),
          _buildHelpSection(
            context,
            'How to manage passwords?',
            [
              '1. Select "Password Manager" on the main page',
              '2. Click the "+" button to add a new password',
              '3. Enter website name, username, and password',
              '4. Click the "Save" button',
              '5. View or edit saved passwords',
            ],
            Icons.vpn_key,
          ),
          const SizedBox(height: 16),
          _buildHelpSection(
            context,
            'How to generate QR codes?',
            [
              '1. Select "QR Code Generator" on the main page',
              '2. Enter the text or URL to convert to QR code',
              '3. Click the "Generate" button',
              '4. View the generated QR code',
              '5. Option to save or share the QR code',
            ],
            Icons.qr_code,
          ),
          const SizedBox(height: 16),
          _buildHelpSection(
            context,
            'How to contact customer support?',
            [
              '1. Select "Settings" on the main page',
              '2. Click "Contact Us"',
              '3. Choose your preferred contact method',
              '4. Describe your issue or question',
              '5. Our support team will respond as soon as possible',
            ],
            Icons.support_agent,
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection(BuildContext context, String title, List<String> steps, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: steps.map((step) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(child: Text(step)),
                    ],
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}