import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

class HelpFeedbackPage extends StatelessWidget {
  const HelpFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Help & Support',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.8),
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildHeaderSection(context),
            const SizedBox(height: 16),
            _buildFAQSection(context),
            const SizedBox(height: 16),
            _buildFeedbackSection(context),
            const SizedBox(height: 16),
            _buildContactSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.support_agent,
                    size: 32, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                const Text(
                  'How can we help you?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Find answers to common questions or reach out to our support team.',
              style:
                  TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(fontSize: 16),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildFAQSection(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.quiz_outlined,
                    size: 28, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _buildFAQItem(
            question: 'How do I get started with the app?',
            answer:
                'Our app features an intuitive onboarding process. When you first launch the app, you\'ll be guided through key features. You can also access this tutorial anytime from the settings menu.',
          ),
          _buildFAQItem(
            question: 'How does the AI companion system work?',
            answer:
                'Our AI companions use advanced natural language processing to provide personalized support. Each companion has unique traits and expertise areas. You can interact with them through text chats and they\'ll respond based on their specific characteristics.',
          ),
          _buildFAQItem(
            question: 'Is my data secure and private?',
            answer:
                'We take your privacy seriously. All conversations are encrypted end-to-end, and your personal data is never shared with third parties. You can review our privacy policy in the settings menu.',
          ),
          _buildFAQItem(
            question: 'Can I customize my experience?',
            answer:
                'Yes! You can personalize various aspects of the app, including themes, notification preferences, and AI interaction styles. Visit the settings page to explore customization options.',
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackSection(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.rate_review_outlined,
                    size: 28, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                const Text(
                  'Share Your Feedback',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Your feedback helps us improve. Tell us about your experience or suggest new features.',
              style:
                  TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type your feedback here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Implement feedback submission logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Thank you for your feedback!'),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit Feedback',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.contact_support_outlined,
                    size: 28, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                const Text(
                  'Contact Support',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              icon: Icons.email_outlined,
              title: 'Email Support',
              subtitle: 'support@aicompanion.com',
              onTap: () {
                // Implement email support action
              },
            ),
            _buildContactItem(
              icon: Icons.chat_outlined,
              title: 'Live Chat',
              subtitle: 'Available 24/7',
              onTap: () {
                // Implement live chat action
              },
            ),
            _buildContactItem(
              icon: Icons.help_outline,
              title: 'Help Center',
              subtitle: 'Browse our knowledge base',
              onTap: () {
                // Implement help center action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 24),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
