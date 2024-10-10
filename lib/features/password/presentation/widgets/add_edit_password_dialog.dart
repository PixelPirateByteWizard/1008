import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/password_controller.dart';

class AddEditPasswordDialog extends ConsumerStatefulWidget {
  final String? initialTitle;
  final String? initialUsername;
  final String? initialPassword;
  final String? initialWebsite;
  final String? initialNotes;
  final Function(String, String, String, String?, String?) onSave;

  const AddEditPasswordDialog({
    super.key,
    this.initialTitle,
    this.initialUsername,
    this.initialPassword,
    this.initialWebsite,
    this.initialNotes,
    required this.onSave,
  });

  @override
  _AddEditPasswordDialogState createState() => _AddEditPasswordDialogState();
}

class _AddEditPasswordDialogState extends ConsumerState<AddEditPasswordDialog> {
  late TextEditingController _titleController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _websiteController;
  late TextEditingController _notesController;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _usernameController = TextEditingController(text: widget.initialUsername);
    _passwordController = TextEditingController(text: widget.initialPassword);
    _websiteController = TextEditingController(text: widget.initialWebsite);
    _notesController = TextEditingController(text: widget.initialNotes);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialTitle == null ? 'Add Password' : 'Edit Password'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: _generatePassword,
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: _websiteController,
              decoration: const InputDecoration(labelText: 'Website (optional)'),
            ),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes (optional)'),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(
              _titleController.text,
              _usernameController.text,
              _passwordController.text,
              _websiteController.text.isNotEmpty ? _websiteController.text : null,
              _notesController.text.isNotEmpty ? _notesController.text : null,
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _generatePassword() {
    final passwordController = ref.read(passwordControllerProvider.notifier);
    final generatedPassword = passwordController.generatePassword();
    setState(() {
      _passwordController.text = generatedPassword;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _websiteController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}