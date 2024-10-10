import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/password.dart';
import 'dart:math';

final passwordControllerProvider = StateNotifierProvider<PasswordController, List<Password>>((ref) {
  return PasswordController();
});

class PasswordController extends StateNotifier<List<Password>> {
  PasswordController() : super([]);

  void addPassword(String title, String username, String password, {String? website, String? notes}) {
    final newPassword = Password(
      id: const Uuid().v4(),
      title: title,
      username: username,
      password: password,
      website: website,
      notes: notes,
    );
    state = [...state, newPassword];
  }

  void editPassword(String id, {String? title, String? username, String? password, String? website, String? notes}) {
    state = [
      for (final pwd in state)
        if (pwd.id == id)
          pwd.copyWith(
            title: title,
            username: username,
            password: password,
            website: website,
            notes: notes,
          )
        else
          pwd,
    ];
  }

  void deletePassword(String id) {
    state = state.where((pwd) => pwd.id != id).toList();
  }

  String generatePassword({int length = 16, bool useSpecialChars = true}) {
    const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String specialChars = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String chars = lowercaseChars + uppercaseChars + numbers;
    if (useSpecialChars) {
      chars += specialChars;
    }

    return List.generate(length, (index) => chars[Random().nextInt(chars.length)]).join();
  }
}