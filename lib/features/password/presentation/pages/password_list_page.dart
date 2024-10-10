import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/password_controller.dart';
import '../widgets/add_edit_password_dialog.dart';
import '../../domain/entities/password.dart';  // 添加这行

class PasswordListPage extends ConsumerWidget {
  const PasswordListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwords = ref.watch(passwordControllerProvider);
    final passwordController = ref.read(passwordControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Manager'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddPasswordDialog(context, ref),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: passwords.length,
        itemBuilder: (context, index) {
          final password = passwords[index];
          return ListTile(
            title: Text(password.title),
            subtitle: Text(password.username),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showEditPasswordDialog(context, ref, password),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => passwordController.deletePassword(password.id),
                ),
              ],
            ),
            onTap: () => _showPasswordDetails(context, password),
          );
        },
      ),
    );
  }

  void _showAddPasswordDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AddEditPasswordDialog(
        onSave: (title, username, password, website, notes) {
          ref.read(passwordControllerProvider.notifier).addPassword(
            title,
            username,
            password,
            website: website,
            notes: notes,
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showEditPasswordDialog(BuildContext context, WidgetRef ref, Password password) {
    showDialog(
      context: context,
      builder: (context) => AddEditPasswordDialog(
        initialTitle: password.title,
        initialUsername: password.username,
        initialPassword: password.password,
        initialWebsite: password.website,
        initialNotes: password.notes,
        onSave: (title, username, newPassword, website, notes) {
          ref.read(passwordControllerProvider.notifier).editPassword(
            password.id,
            title: title,
            username: username,
            password: newPassword,
            website: website,
            notes: notes,
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showPasswordDetails(BuildContext context, Password password) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(password.title),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Username: ${password.username}'),
            const SizedBox(height: 8),
            Text('Password: ${password.password}'),
            if (password.website != null) ...[
              const SizedBox(height: 8),
              Text('Website: ${password.website}'),
            ],
            if (password.notes != null) ...[
              const SizedBox(height: 8),
              Text('Notes: ${password.notes}'),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}