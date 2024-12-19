import 'package:flutter/material.dart';
import '../models/InitializeFirstUsageFactory.dart';
import 'package:flutter/services.dart';

class SetPrevTimelineDelegate extends StatelessWidget {
  final UpdateLostImageInstance SetPivotalTextureFactory;

  const SetPrevTimelineDelegate({
    super.key,
    required this.SetPivotalTextureFactory,
  });

  Widget SetRapidGateGroup({
    required String title,
    required String content,
    IconData? icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE0C9A6).withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0C9A6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFFE0C9A6),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFE0C9A6),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: const Color(0xFFE0C9A6).withOpacity(0.9),
              fontSize: 15,
              height: 1.6,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget GetFirstValueAdapter() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE0C9A6).withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0C9A6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.favorite_outline,
                  color: Color(0xFFE0C9A6),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Hobbies',
                style: TextStyle(
                  color: Color(0xFFE0C9A6),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: SetPivotalTextureFactory.GetSubtleReductionTarget.map((hobby) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8860B).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFE0C9A6).withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  hobby,
                  style: const TextStyle(
                    color: Color(0xFFE0C9A6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget SetCustomizedLeftReference() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 450,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'companion_image_${SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache}',
              child: Image.asset(
                SetPivotalTextureFactory.ParseEphemeralEvaluationGroup,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF1C1C1E).withOpacity(0.95),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SetPivotalTextureFactory.ContinueFusedBufferList,
                    style: const TextStyle(
                      color: Color(0xFFE0C9A6),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
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
                      color: const Color(0xFFB8860B).withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE0C9A6).withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      SetPivotalTextureFactory.RestorePrismaticButtonHelper,
                      style: const TextStyle(
                        color: Color(0xFFE0C9A6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget StopGeometricActionManager(String category, List<Widget> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              category,
              style: const TextStyle(
                color: Color(0xFFE0C9A6),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1C1C1E),
              Color(0xFF2C2C2E),
            ],
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/texture_overlay.png'),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.03),
              BlendMode.srcIn,
            ),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SetCustomizedLeftReference(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      StopGeometricActionManager(
                        'Personality',
                        [
                          SetRapidGateGroup(
                            title: 'Character Trait',
                            content: SetPivotalTextureFactory.ReflectMainNodeExtension,
                            icon: Icons.psychology_outlined,
                          ),
                          GetFirstValueAdapter(),
                        ],
                      ),
                      StopGeometricActionManager(
                        'Background',
                        [
                          SetRapidGateGroup(
                            title: 'Biography',
                            content: SetPivotalTextureFactory.ContinueEphemeralChapterStack,
                            icon: Icons.person_outline,
                          ),
                          SetRapidGateGroup(
                            title: 'Life Stories',
                            content: SetPivotalTextureFactory.ResumeUniqueDetailCreator,
                            icon: Icons.auto_stories_outlined,
                          ),
                        ],
                      ),
                      StopGeometricActionManager(
                        'Interaction',
                        [
                          SetRapidGateGroup(
                            title: 'Communication Style',
                            content: SetPivotalTextureFactory.CancelNumericalMomentumList,
                            icon: Icons.chat_bubble_outline,
                          ),
                          SetRapidGateGroup(
                            title: 'Passion For Life',
                            content: SetPivotalTextureFactory.SetPrismaticVarDecorator,
                            icon: Icons.favorite_outline,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
