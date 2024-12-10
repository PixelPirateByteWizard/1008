import 'package:flutter/material.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'What\'s New',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Latest Updates &',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                      height: 1.2,
                    ),
                  ),
                  const Text(
                    'Improvements',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Discover our latest features and enhancements designed to make your experience even better',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF7F8C8D).withOpacity(0.8),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildFeatureCard(
                  context,
                  version: 'Version 1.2.0',
                  date: 'March 2024',
                  features: [
                    'Multi-Character AI Conversations: Engage in dynamic conversations with multiple AI personalities simultaneously',
                    'Custom AI Character Creation: Design and customize your own AI characters with unique personalities and traits',
                    'Enhanced Chat Interface: Improved UI/UX for smoother conversation flow and better readability',
                    'Performance Optimization: Faster response times and reduced latency for seamless interactions',
                    'Advanced Voice Recognition: More accurate speech-to-text conversion with support for multiple languages',
                  ],
                  icon: Icons.auto_awesome,
                  color: const Color(0xFF3498DB),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  version: 'Version 1.1.0',
                  date: 'February 2024',
                  features: [
                    'Voice Input Integration: Seamlessly communicate with AI using natural speech',
                    'Image Generation: Create unique images from text descriptions powered by advanced AI',
                    'Redesigned Interface: Fresh, modern look with improved navigation and accessibility',
                    'Chat History Management: Better organization and search capabilities for past conversations',
                    'Offline Mode Support: Access basic features without an internet connection',
                  ],
                  icon: Icons.new_releases,
                  color: const Color(0xFF2ECC71),
                ),
                const SizedBox(height: 16),
                _buildFeatureCard(
                  context,
                  version: 'Version 1.0.0',
                  date: 'January 2024',
                  features: [
                    'Initial Release: Core AI chat functionality with basic character support',
                    'Character Marketplace: Browse and interact with pre-designed AI personalities',
                    'Real-time Responses: Quick and contextually aware AI interactions',
                    'User Profiles: Personalized experience with customizable settings',
                    'Dark Mode Support: Comfortable viewing experience in low-light conditions',
                  ],
                  icon: Icons.rocket_launch,
                  color: const Color(0xFF9B59B6),
                ),
                const SizedBox(height: 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String version,
    required String date,
    required List<String> features,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1A1A1A).withOpacity(0.06),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      version,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF7F8C8D).withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 12,
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
