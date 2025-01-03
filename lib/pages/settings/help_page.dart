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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _helpItems.length,
        itemBuilder: (context, index) {
          final item = _helpItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                leading: Icon(
                  item.icon,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  item.question,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      item.answer,
                      style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HelpItem {
  final IconData icon;
  final String question;
  final String answer;

  const _HelpItem({
    required this.icon,
    required this.question,
    required this.answer,
  });
}

final _helpItems = [
  const _HelpItem(
    icon: Icons.qr_code,
    question: 'How to generate a QR code?',
    answer:
        'Enter the text or URL in the input field and the QR code will be generated automatically. You can save or share the generated QR code.',
  ),
  const _HelpItem(
    icon: Icons.qr_code_scanner,
    question: 'How to scan a QR code?',
    answer:
        'Switch to the scan tab and point your camera at the QR code. The app will automatically detect and scan the code.',
  ),
  const _HelpItem(
    icon: Icons.record_voice_over,
    question: 'How to use text to speech?',
    answer:
        'Enter your text, adjust the speech settings like language and speed, then tap the speak button to hear the text.',
  ),
  const _HelpItem(
    icon: Icons.note_add,
    question: 'How to create a quick note?',
    answer:
        'Tap the + button, enter your note title and content, select a category, and tap save. Your note will be saved instantly.',
  ),
];
