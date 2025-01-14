import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/sample_characters.dart';
import '../models/companion.dart';
import 'dart:math';
import 'dart:ui';
import 'chat_page.dart';
import 'companion_profile_page.dart';

class SupportCirclePage extends StatefulWidget {
  const SupportCirclePage({super.key});

  @override
  State<SupportCirclePage> createState() => _SupportCirclePageState();
}

class _SupportCirclePageState extends State<SupportCirclePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Companion> _filteredCompanions = [];

  @override
  void initState() {
    super.initState();
    _filteredCompanions = sampleCharacters;
    _searchController.addListener(_filterCompanions);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCompanions() {
    setState(() {
      _filteredCompanions = sampleCharacters
          .where((companion) => companion.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(16),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Support Circle',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Connect with your support network',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
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
                                              'Basic Navigation:\n'
                                              '• Tap any companion card to start a conversation\n'
                                              '• Use search bar to find specific companions\n\n'
                                              'Profile & Details:\n'
                                              '• Tap companion\'s avatar to view full profile\n'
                                              '• View skills and specialties in profile\n\n'
                                              'Interactive Features:\n'
                                              '• Long press for additional options\n'
                                              '• Tap skill icons to see detailed abilities\n'
                                              '• Pull down to refresh companion list\n\n'
                                              'Badges & Status:\n'
                                              '• Look for special badges (TOP, VIP, etc.)\n'
                                              '• Check companion status and availability',
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
                          const SizedBox(height: 16),
                          TextField(
                            controller: _searchController,
                            maxLength: 40,
                            decoration: InputDecoration(
                              hintText: 'Search companions...',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() {});
                                      },
                                    )
                                  : null,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              counterText: '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _filteredCompanions.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No companions found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try different search terms',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        )
                      : AnimatedList(
                          padding: const EdgeInsets.all(16),
                          initialItemCount: _filteredCompanions.length,
                          itemBuilder: (context, index, animation) {
                            final companion = _filteredCompanions[index];
                            return SlideTransition(
                              position: animation.drive(Tween(
                                begin: const Offset(0.5, 0),
                                end: Offset.zero,
                              )),
                              child: CompanionCard(companion: companion),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompanionCard extends StatelessWidget {
  final Companion companion;

  const CompanionCard({
    super.key,
    required this.companion,
  });

  List<Badge> _getRandomBadges() {
    final badges = [
      Badge(
          label: 'TOP',
          color: const Color(0xFFFF6B6B),
          icon: Icons.star_rounded),
      Badge(
          label: 'VIP',
          color: const Color(0xFFFFB347),
          icon: Icons.diamond_rounded),
      Badge(
          label: 'PRO',
          color: const Color(0xFF4ECDC4),
          icon: Icons.workspace_premium_rounded),
      Badge(
          label: 'NEW',
          color: const Color(0xFF45B7D1),
          icon: Icons.new_releases_rounded),
      Badge(
          label: 'HOT',
          color: const Color(0xFFFF8C42),
          icon: Icons.local_fire_department_rounded),
    ];

    badges.shuffle();
    return badges.take(1 + Random().nextInt(2)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final badges = _getRandomBadges();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 16),
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
                builder: (context) => ChatPage(companion: companion),
              ),
            );
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Hero(
                            tag: 'companion_avatar_${companion.id}',
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CompanionProfilePage(
                                        companion: companion,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: AssetImage(companion.avatarAsset),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                companion.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  companion.characterType,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      companion.skillDescription,
                      style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.6,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final iconSize = 48.0;
                        final containerSize = 106.0;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var skillIcon in companion.skillIcons)
                              Container(
                                width: containerSize,
                                height: containerSize,
                                decoration: BoxDecoration(
                                  color: skillIcon.color.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  skillIcon.icon,
                                  color: skillIcon.color,
                                  size: iconSize,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < badges.length; i++)
                      Padding(
                        padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                        child: badges[i],
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
}

class Badge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const Badge({
    super.key,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
