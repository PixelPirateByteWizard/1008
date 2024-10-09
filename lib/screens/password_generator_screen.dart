import 'package:flutter/material.dart';
import 'dart:math';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  String _generatedPassword = '';
  int _passwordLength = 12;
  bool _useUppercase = true;
  bool _useLowercase = true;
  bool _useNumbers = true;
  bool _useSpecialChars = true;

  void _generatePassword() {
    String chars = '';
    if (_useLowercase) chars += 'abcdefghijklmnopqrstuvwxyz';
    if (_useUppercase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (_useNumbers) chars += '0123456789';
    if (_useSpecialChars) chars += '!@#\$%^&*()';

    if (chars.isEmpty) {
      setState(() {
        _generatedPassword = 'Please select at least one character type';
      });
      return;
    }

    Random rnd = Random.secure();
    String result = List.generate(
        _passwordLength, (index) => chars[rnd.nextInt(chars.length)]).join();

    setState(() {
      _generatedPassword = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Generated Password:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _generatedPassword,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.blue),
                    onPressed: () {
                      // Implement copy functionality
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Password Length: $_passwordLength',
                style: const TextStyle(fontSize: 16)),
            Slider(
              value: _passwordLength.toDouble(),
              min: 8,
              max: 32,
              divisions: 24,
              label: _passwordLength.toString(),
              onChanged: (double value) {
                setState(() {
                  _passwordLength = value.round();
                });
              },
            ),
            const SizedBox(height: 16),
            _buildCheckboxListTile('Include Uppercase Letters', _useUppercase,
                (bool? value) {
              setState(() {
                _useUppercase = value ?? false;
              });
            }),
            _buildCheckboxListTile('Include Lowercase Letters', _useLowercase,
                (bool? value) {
              setState(() {
                _useLowercase = value ?? false;
              });
            }),
            _buildCheckboxListTile('Include Numbers', _useNumbers,
                (bool? value) {
              setState(() {
                _useNumbers = value ?? false;
              });
            }),
            _buildCheckboxListTile(
                'Include Special Characters', _useSpecialChars, (bool? value) {
              setState(() {
                _useSpecialChars = value ?? false;
              });
            }),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _generatePassword,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Generate Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxListTile(
      String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
      contentPadding: EdgeInsets.zero,
    );
  }
}
