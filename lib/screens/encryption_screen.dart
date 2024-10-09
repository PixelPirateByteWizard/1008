import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({super.key});

  @override
  _EncryptionScreenState createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  String _output = '';
  bool _isEncrypted = false;

  void _encrypt() {
    _processText(true);
  }

  void _decrypt() {
    _processText(false);
  }

  void _processText(bool encrypt) {
    if (_inputController.text.isEmpty || _keyController.text.isEmpty) {
      _showAlert('Please enter text and key');
      return;
    }
    try {
      final text = _inputController.text;
      final key = _keyController.text;

      setState(() {
        if (encrypt) {
          _output = _xorEncrypt(text, key);
          _isEncrypted = true;
        } else {
          _output = _xorDecrypt(text, key);
          _isEncrypted = false;
        }
      });
    } catch (e) {
      _showAlert(encrypt
          ? 'Encryption failed'
          : 'Decryption failed: Please check the key and input');
    }
  }

  String _xorEncrypt(String text, String key) {
    List<int> encrypted = [];
    List<int> textBytes = utf8.encode(text);
    List<int> keyBytes = utf8.encode(key);
    for (int i = 0; i < textBytes.length; i++) {
      encrypted.add(textBytes[i] ^ keyBytes[i % keyBytes.length]);
    }
    return base64.encode(encrypted);
  }

  String _xorDecrypt(String encoded, String key) {
    List<int> decrypted = [];
    List<int> encodedBytes = base64.decode(encoded);
    List<int> keyBytes = utf8.encode(key);
    for (int i = 0; i < encodedBytes.length; i++) {
      decrypted.add(encodedBytes[i] ^ keyBytes[i % keyBytes.length]);
    }
    return utf8.decode(decrypted);
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _output));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void _clearAll() {
    setState(() {
      _inputController.clear();
      _keyController.clear();
      _output = '';
      _isEncrypted = false;
    });
  }

  void _swapInputOutput() {
    setState(() {
      _inputController.text = _output;
      _output = '';
    });
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notice'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encrypt/Decrypt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _clearAll,
            tooltip: 'Clear All',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _inputController,
                      decoration: InputDecoration(
                        labelText: 'Input Text',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _inputController.clear(),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _keyController,
                      decoration: InputDecoration(
                        labelText: 'Key',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _keyController.clear(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _encrypt,
                    icon: const Icon(Icons.lock),
                    label: const Text('Encrypt'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _decrypt,
                    icon: const Icon(Icons.lock_open),
                    label: const Text('Decrypt'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_output.isNotEmpty) ...[
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Result:',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(_output),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _copyToClipboard,
                              icon: const Icon(Icons.copy),
                              label: const Text('Copy Result'),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _swapInputOutput,
                              icon: const Icon(Icons.swap_vert),
                              label: const Text('Use as Input'),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
