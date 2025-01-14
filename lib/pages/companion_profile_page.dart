import 'package:flutter/material.dart';
import '../models/companion.dart';
import '../services/friends_service.dart';
import '../models/friend.dart';
import 'chat_page.dart';

class CompanionProfilePage extends StatefulWidget {
  final Companion companion;
  final bool fromChat;

  const CompanionProfilePage({
    super.key,
    required this.companion,
    this.fromChat = false,
  });

  @override
  State<CompanionProfilePage> createState() => _CompanionProfilePageState();
}

class _CompanionProfilePageState extends State<CompanionProfilePage> {
  bool _isFriend = false;

  @override
  void initState() {
    super.initState();
    _checkFriendStatus();
  }

  Future<void> _checkFriendStatus() async {
    final isFriend = await FriendsService.isFriend(widget.companion.id);
    setState(() {
      _isFriend = isFriend;
    });
  }

  Future<void> _addFriend() async {
    if (!_isFriend) {
      final success = await FriendsService.addFriend(Friend(
        id: widget.companion.id,
        name: widget.companion.name,
        avatarAsset: widget.companion.avatarAsset,
      ));

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Friend added successfully!')),
        );
        setState(() {
          _isFriend = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Already friends')),
        );
      }
    }
  }

  void _navigateToChat() {
    if (widget.fromChat) {
      Navigator.pop(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            companion: widget.companion,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _isFriend
                          ? Colors.grey[200]
                          : Theme.of(context).primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: _isFriend
                              ? Colors.grey[600]
                              : Theme.of(context).primaryColor,
                          size: 24,
                        ),
                        if (_isFriend)
                          Positioned(
                            right: -4,
                            bottom: -4,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  onPressed: _isFriend ? null : _addFriend,
                  tooltip: _isFriend ? 'Added' : 'Add Friend',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  onPressed: _navigateToChat,
                  tooltip: 'Start Chat',
                ),
              ),
            ],
            collapsedHeight: 80,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final top = constraints.biggest.height;
                final expandRatio =
                    (top - 80) / (MediaQuery.of(context).size.height - 80);

                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.zero,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: 'companion_avatar_${widget.companion.id}',
                        child: Image.asset(
                          widget.companion.avatarAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.7),
                            ],
                            stops: const [0.0, 0.3, 0.6, 0.9],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        top: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.companion.name,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 4,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                widget.companion.characterType,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _SwipeUpIndicator(),
                    ],
                  ),
                );
              },
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.companion.skillDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (var skill in widget.companion.skills) ...[
                    _SkillCard(skill: skill),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final Skill skill;

  const _SkillCard({
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            skill.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: skill.insights.map((insight) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.tips_and_updates_outlined,
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            insight,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SwipeUpIndicator extends StatefulWidget {
  @override
  State<_SwipeUpIndicator> createState() => _SwipeUpIndicatorState();
}

class _SwipeUpIndicatorState extends State<_SwipeUpIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Swipe up for details',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  shadows: const [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      color: Colors.black26,
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
