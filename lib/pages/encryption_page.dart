import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final encryptionControllerProvider = StateNotifierProvider<EncryptionController, EncryptionState>((ref) {
  return EncryptionController();
});

class EncryptionController extends StateNotifier<EncryptionState> {
  EncryptionController() : super(EncryptionState());

  void updateInputText(String text) {
    state = state.copyWith(inputText: text);
  }

  void updateKey(String key) {
    state = state.copyWith(key: key);
  }

  void encrypt() {
    if (state.inputText.isEmpty || state.key.isEmpty) return;
    final encrypted = _xorCipher(state.inputText, state.key);
    state = state.copyWith(outputText: encrypted);
  }

  void decrypt() {
    if (state.inputText.isEmpty || state.key.isEmpty) return;
    final decrypted = _xorCipher(state.inputText, state.key);
    state = state.copyWith(outputText: decrypted);
  }

  void clearAll() {
    state = EncryptionState();
  }

  String _xorCipher(String input, String key) {
    final List<int> inputBytes = input.codeUnits;
    final List<int> keyBytes = key.codeUnits;
    final List<int> outputBytes = [];

    for (int i = 0; i < inputBytes.length; i++) {
      final int keyByte = keyBytes[i % keyBytes.length];
      outputBytes.add(inputBytes[i] ^ keyByte);
    }

    return String.fromCharCodes(outputBytes);
  }
}

class EncryptionState {
  final String inputText;
  final String outputText;
  final String key;

  EncryptionState({
    this.inputText = '',
    this.outputText = '',
    this.key = '',
  });

  EncryptionState copyWith({
    String? inputText,
    String? outputText,
    String? key,
  }) {
    return EncryptionState(
      inputText: inputText ?? this.inputText,
      outputText: outputText ?? this.outputText,
      key: key ?? this.key,
    );
  }
}

class EncryptionPage extends ConsumerWidget {
  const EncryptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(encryptionControllerProvider);
    final controller = ref.read(encryptionControllerProvider.notifier);

    final inputController = TextEditingController(text: state.inputText);
    final keyController = TextEditingController(text: state.key);
    final outputController = TextEditingController(text: state.outputText);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption/Decryption'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.clearAll();
              inputController.clear();
              keyController.clear();
              outputController.clear();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: keyController,
              decoration: const InputDecoration(
                labelText: 'Encryption Key',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.updateKey,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                labelText: 'Input Text',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              onChanged: controller.updateInputText,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.encrypt();
                      FocusScope.of(context).unfocus();
                      outputController.text = state.outputText;
                    },
                    child: const Text('Encrypt'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.decrypt();
                      FocusScope.of(context).unfocus();
                      outputController.text = state.outputText;
                    },
                    child: const Text('Decrypt'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: outputController,
                    decoration: const InputDecoration(
                      labelText: 'Output Text',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: state.outputText));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied to clipboard')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}