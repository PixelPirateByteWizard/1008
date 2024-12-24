import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text('Terms of Service content...'),
      ),
    );
  }
}
