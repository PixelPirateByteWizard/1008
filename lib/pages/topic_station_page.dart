import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'group_chat_page.dart';

class TopicStationPage extends StatelessWidget {
  const TopicStationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Choose Your Expert',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Select the type of expertise you need',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.tips_and_updates_rounded,
                                  color: Theme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.tips_and_updates,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 28,
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                'Features Guide',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            'How to Use:\n'
                                            '• Tap any expert card to start chatting\n'
                                            '• Each expert has unique specialties\n'
                                            '• Switch experts anytime you need\n\n'
                                            'Available Experts:\n'
                                            '• Creative: Design & artistic guidance\n'
                                            '• Tech: Programming & technical help\n'
                                            '• Lifestyle: Wellness & daily advice\n'
                                            '• Efficiency: Productivity tips',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  height: 1.6,
                                                  color: Colors.grey[800],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildExpertCard(
                      context: context,
                      icon: Icons.palette,
                      label: 'Creative Expert',
                      color: const Color(0xFF7CB342),
                      description:
                          'Get help with art, design, and creative projects',
                      skills: const [],
                    ),
                    const SizedBox(height: 16),
                    _buildExpertCard(
                      context: context,
                      icon: Icons.code,
                      label: 'Tech Expert',
                      color: const Color(0xFF5C6BC0),
                      description: 'Technical support and programming guidance',
                      skills: const [],
                    ),
                    const SizedBox(height: 16),
                    _buildExpertCard(
                      context: context,
                      icon: Icons.spa,
                      label: 'Lifestyle Expert',
                      color: const Color(0xFFEF9A9A),
                      description: 'Advice on wellness and daily living',
                      skills: const [],
                    ),
                    const SizedBox(height: 16),
                    _buildExpertCard(
                      context: context,
                      icon: Icons.speed,
                      label: 'Efficiency Expert',
                      color: const Color(0xFFFFB74D),
                      description: 'Optimize your work and productivity',
                      skills: const [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpertCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required String description,
    required List<String> skills,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupChatPage(expertType: label),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: skills
                      .map(
                        (skill) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            skill,
                            style: TextStyle(
                              color: color,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
