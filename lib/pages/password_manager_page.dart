import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PasswordEntry {
  final String website;
  final String username;
  final String password;

  PasswordEntry({
    required this.website,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'website': website,
        'username': username,
        'password': password,
      };

  factory PasswordEntry.fromJson(Map<String, dynamic> json) => PasswordEntry(
        website: json['website'],
        username: json['username'],
        password: json['password'],
      );
}

final passwordManagerProvider =
    StateNotifierProvider<PasswordManagerNotifier, List<PasswordEntry>>(
        (ref) => PasswordManagerNotifier());

class PasswordManagerNotifier extends StateNotifier<List<PasswordEntry>> {
  PasswordManagerNotifier() : super([]) {
    _loadPasswords();
  }

  Future<void> _loadPasswords() async {
    final prefs = await SharedPreferences.getInstance();
    final passwordsJson = prefs.getString('passwords');
    if (passwordsJson != null) {
      final passwordsList = jsonDecode(passwordsJson) as List;
      state = passwordsList
          .map((item) => PasswordEntry.fromJson(item))
          .toList();
    }
  }

  Future<void> _savePasswords() async {
    final prefs = await SharedPreferences.getInstance();
    final passwordsJson = jsonEncode(state.map((e) => e.toJson()).toList());
    await prefs.setString('passwords', passwordsJson);
  }

  void addPassword(PasswordEntry entry) {
    state = [...state, entry];
    _savePasswords();
  }

  void removePassword(int index) {
    state = [...state]..removeAt(index);
    _savePasswords();
  }
}

class PasswordManagerPage extends ConsumerWidget {
  const PasswordManagerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwords = ref.watch(passwordManagerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Password Manager')),
      body: ListView.builder(
        itemCount: passwords.length,
        itemBuilder: (context, index) {
          final entry = passwords[index];
          return ListTile(
            title: Text(entry.website),
            subtitle: Text(entry.username),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () =>
                  ref.read(passwordManagerProvider.notifier).removePassword(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPasswordDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddPasswordDialog(BuildContext context, WidgetRef ref) {
    final websiteController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: websiteController,
              decoration: const InputDecoration(labelText: 'Website'),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final entry = PasswordEntry(
                website: websiteController.text,
                username: usernameController.text,
                password: passwordController.text,
              );
              ref.read(passwordManagerProvider.notifier).addPassword(entry);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}