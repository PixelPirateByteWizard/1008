import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/friend.dart';
import '../services/friends_service.dart';
import '../data/sample_characters.dart';
import 'dart:math';
import 'chat_page.dart';
import '../models/companion.dart';
import 'companion_profile_page.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<Friend> _friends = [];
  final TextEditingController _searchController = TextEditingController();
  List<Friend> _filteredFriends = [];
  bool _sortByName = false;

  @override
  void initState() {
    super.initState();
    _loadFriends();
    _searchController.addListener(_filterFriends);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadFriends() async {
    final friends = await FriendsService.getFriends();
    setState(() {
      _friends = friends;
      _filteredFriends = friends;
    });
  }

  void _filterFriends() {
    setState(() {
      _filteredFriends = _friends
          .where((friend) => friend.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  Future<void> _removeFriend(Friend friend) async {
    await FriendsService.removeFriend(friend.id);
    await _loadFriends();
  }

  List<Badge> _getRandomBadges() {
    final badges = [
      Badge(
        label: 'TOP',
        color: const Color(0xFFFF6B6B),
        icon: Icons.star_rounded,
      ),
      Badge(
        label: 'VIP',
        color: const Color(0xFFFFB347),
        icon: Icons.diamond_rounded,
      ),
      Badge(
        label: 'PRO',
        color: const Color(0xFF4ECDC4),
        icon: Icons.workspace_premium_rounded,
      ),
      Badge(
        label: 'NEW',
        color: const Color(0xFF45B7D1),
        icon: Icons.new_releases_rounded,
      ),
      Badge(
        label: 'HOT',
        color: const Color(0xFFFF8C42),
        icon: Icons.local_fire_department_rounded,
      ),
    ];

    badges.shuffle();
    return badges.take(1 + Random().nextInt(2)).toList();
  }

  void _showTipsDialog() {
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
                    color: Theme.of(context).primaryColor,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Tips & Tricks',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '• Tap on a friend card to start chatting\n'
                '• Long press for more options\n'
                '• Swipe left to quickly remove a friend\n'
                '• Tap on avatar to view friend\'s profile\n'
                '• Use search to quickly find friends\n'
                '• Tap on skill icons to see abilities\n'
                '• Pull to refresh friend list',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.8,
                      color: Colors.grey[800],
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSort() {
    setState(() {
      _sortByName = !_sortByName;
      if (_sortByName) {
        _filteredFriends.sort((a, b) => a.name.compareTo(b.name));
        _friends.sort((a, b) => a.name.compareTo(b.name));
      } else {
        // Assuming friends are stored in chronological order in the database
        _loadFriends();
      }
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
                              Text(
                                'Friends List',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Row(
                                children: [
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
                                        _sortByName
                                            ? Icons.sort_by_alpha
                                            : Icons.sort,
                                        color: Theme.of(context).primaryColor,
                                        size: 24,
                                      ),
                                    ),
                                    onPressed: _toggleSort,
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
                                    onPressed: _showTipsDialog,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Meet like-minded companions\n'
                            'Make every conversation an art of connection',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.grey[600],
                                      height: 1.5,
                                    ),
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _searchController,
                            maxLength: 40,
                            decoration: InputDecoration(
                              hintText: 'Search friends...',
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
                  child: _filteredFriends.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people_outline_rounded,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No Friends Yet',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          physics: const BouncingScrollPhysics(),
                          itemCount: _filteredFriends.length,
                          itemBuilder: (context, index) {
                            final friend = _filteredFriends[index];
                            final companion = sampleCharacters.firstWhere(
                              (c) => c.id == friend.id,
                              orElse: () => sampleCharacters[0],
                            );

                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  HapticFeedback.lightImpact();

                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          ChatPage(
                                        companion: Companion(
                                          id: friend.id,
                                          name: friend.name,
                                          avatarAsset: friend.avatarAsset,
                                          characterType:
                                              companion.characterType,
                                          skills: companion.skills,
                                          skillDescription:
                                              companion.skillDescription,
                                          skillIcons: companion.skillIcons,
                                          themeColor: companion.themeColor,
                                        ),
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeInOutCubic;

                                        var tween =
                                            Tween(begin: begin, end: end).chain(
                                          CurveTween(curve: curve),
                                        );

                                        var fadeAnimation = Tween<double>(
                                          begin: 0.0,
                                          end: 1.0,
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: curve,
                                          ),
                                        );

                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: FadeTransition(
                                            opacity: fadeAnimation,
                                            child: child,
                                          ),
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 400),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        offset: const Offset(0, 4),
                                        blurRadius: 16,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Hero(
                                                  tag:
                                                      'friend_avatar_${friend.id}',
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      HapticFeedback
                                                          .lightImpact();

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CompanionProfilePage(
                                                            companion:
                                                                Companion(
                                                              id: friend.id,
                                                              name: friend.name,
                                                              avatarAsset: friend
                                                                  .avatarAsset,
                                                              characterType:
                                                                  companion
                                                                      .characterType,
                                                              skills: companion
                                                                  .skills,
                                                              skillDescription:
                                                                  companion
                                                                      .skillDescription,
                                                              skillIcons:
                                                                  companion
                                                                      .skillIcons,
                                                              themeColor:
                                                                  companion
                                                                      .themeColor,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 80,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                            blurRadius: 8,
                                                          ),
                                                        ],
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              friend
                                                                  .avatarAsset),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment
                                                              .topCenter,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              friend.name,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                height: 1.2,
                                                              ),
                                                            ),
                                                          ),
                                                          ...(() {
                                                            final badges =
                                                                _getRandomBadges();
                                                            return badges.map(
                                                              (badge) =>
                                                                  Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            8),
                                                                child: badge,
                                                              ),
                                                            );
                                                          })(),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 14,
                                                          vertical: 8,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor
                                                                  .withOpacity(
                                                                      0.08),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Text(
                                                          companion
                                                              .characterType,
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Wrap(
                                                    spacing: 12,
                                                    runSpacing: 12,
                                                    children: companion
                                                        .skillIcons
                                                        .map((skillIcon) =>
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: skillIcon
                                                                    .color
                                                                    .withOpacity(
                                                                        0.08),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                border:
                                                                    Border.all(
                                                                  color: skillIcon
                                                                      .color
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 1,
                                                                ),
                                                              ),
                                                              child: Icon(
                                                                skillIcon.icon,
                                                                size: 18,
                                                                color: skillIcon
                                                                    .color,
                                                              ),
                                                            ))
                                                        .toList(),
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () =>
                                                        _removeFriend(friend),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red[50],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .person_remove_rounded,
                                                        color: Colors.red[400],
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 16,
                                        top: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 16,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
