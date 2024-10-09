import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Guide'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildSectionTitle('Welcome to Encryptrix'),
          _buildDescription(
              'Encryptrix is a comprehensive security tool designed to protect your digital life. It integrates password generation, data encryption, and QR code creation features, making it easy to manage the security of your personal information.'),
          const SizedBox(height: 30),
          _buildSectionTitle('Key Features'),
          _buildFeatureList([
            'Password Generation: Create strong, unique passwords',
            'Data Encryption: Protect your sensitive information',
            'QR Code Creation: Easily share encrypted data',
            'Local Storage: Securely save your encryption results',
          ]),
          const SizedBox(height: 30),
          _buildSectionTitle('User Guide'),
          _buildStepList([
            'Choose the desired function (Password Generation, Data Encryption, or QR Code Creation)',
            'Enter the necessary information as prompted',
            'Click the corresponding button to execute the operation',
            'View the results and save or share as needed',
          ]),
          const SizedBox(height: 30),
          _buildSectionTitle('FAQ'),
          _buildFAQ(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget _buildFeatureList(List<String> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(feature,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87))),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildStepList(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps.asMap().entries.map((entry) {
        int idx = entry.key;
        String step = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue,
                child: Text('${idx + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(step,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.black87))),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFAQ() {
    return ExpansionPanelList.radio(
      elevation: 2,
      expandedHeaderPadding: const EdgeInsets.all(8),
      children: [
        ExpansionPanelRadio(
          value: 0,
          headerBuilder: (context, isExpanded) => const ListTile(
              title: Text('How to save encryption results?',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          body: const ListTile(
              title: Text(
                  'Click the save icon next to the encryption result to save it locally.')),
        ),
        ExpansionPanelRadio(
          value: 1,
          headerBuilder: (context, isExpanded) => const ListTile(
              title: Text('Is the encrypted data secure?',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          body: const ListTile(
              title: Text(
                  'Yes, we use advanced encryption algorithms to ensure your data is secure. All encryption processes are performed locally and are not uploaded to any server.')),
        ),
        ExpansionPanelRadio(
          value: 2,
          headerBuilder: (context, isExpanded) => const ListTile(
              title: Text('What if I forget my password?',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          body: const ListTile(
              title: Text(
                  'We recommend using a password manager to save important passwords. Encryptrix cannot recover forgotten passwords as we do not store any user passwords.')),
        ),
      ],
    );
  }
}
