import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSearchBar(context),
          const SizedBox(height: 24),
          _buildHelpSection(
            context,
            title: 'Getting Started',
            icon: Icons.rocket_launch_rounded,
            color: const Color(0xFF3498DB),
            items: [
              HelpItem(
                question: 'How do I start exploring earring combinations?',
                answer:
                    'Browse through our curated collection of community-shared earring pairings. Use the search feature to find specific styles, or scroll through the feed for inspiration. Each card shows detailed information about the combination and its creator.',
              ),
              HelpItem(
                question: 'Can I share my own earring combinations?',
                answer:
                    'Absolutely! Tap the "+" button to create a new post. You can:\n• Upload photos of your earring combination\n• Add a description and styling tips\n• Tag specific earring types and styles\n• Share your inspiration behind the pairing',
              ),
              HelpItem(
                question: 'How does the recommendation system work?',
                answer:
                    'Our AI-powered system analyzes your preferences, saved combinations, and browsing history to suggest personalized earring pairings. The more you interact with the app, the more tailored your recommendations become.',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildHelpSection(
            context,
            title: 'Pro Tips & Features',
            icon: Icons.auto_awesome_rounded,
            color: const Color(0xFF9B59B6),
            items: [
              HelpItem(
                question: 'How to get the most out of the app?',
                answer:
                    '1. Complete your style profile for better recommendations\n2. Save your favorite combinations for quick access\n3. Follow creators with similar style preferences\n4. Use filters to discover specific types of pairings\n5. Participate in weekly styling challenges',
              ),
              HelpItem(
                question: 'What are Premium features?',
                answer:
                    'Premium members enjoy:\n• AI-powered style recommendations\n• Advanced filtering options\n• Early access to new features\n• Ad-free experience\n• Exclusive styling workshops\n• Priority customer support',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildHelpSection(
            context,
            title: 'Account Related',
            icon: Icons.account_circle_rounded,
            color: Colors.green,
            items: [
              HelpItem(
                question: 'How to modify account information?',
                answer:
                    'Enter "Settings-Personal Information", you can modify your nickname, avatar, etc. Some information (such as registered email) may require verification before modification.',
              ),
              HelpItem(
                question: 'What if I forget my password?',
                answer:
                    'Click the "Forget Password" on the login page, reset your password through email or phone number. For the security of your account, it is recommended to change your password regularly.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFECF0F1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search help articles...',
          hintStyle: const TextStyle(
            color: Color(0xFF95A5A6),
            fontSize: 14,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF95A5A6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onChanged: (value) {
          // Implement search functionality
        },
      ),
    );
  }

  Widget _buildHelpSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required List<HelpItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
          ...items.map((item) => _buildHelpItem(context, item)).toList(),
        ],
      ),
    );
  }

  Widget _buildHelpItem(BuildContext context, HelpItem item) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          item.question,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              item.answer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class HelpItem {
  final String question;
  final String answer;

  const HelpItem({
    required this.question,
    required this.answer,
  });
}
