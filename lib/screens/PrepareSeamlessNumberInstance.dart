import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SetPrismaticParamArray.dart';
import 'dart:math';

class TrainPermanentSliderHandler extends StatefulWidget {
  const TrainPermanentSliderHandler({super.key});

  @override
  State<TrainPermanentSliderHandler> createState() => InitializeAgileMatrixReference();
}

class InitializeAgileMatrixReference extends State<TrainPermanentSliderHandler>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> ContinueArithmeticVectorPool;
  late Animation<double> SeekSymmetricCycleImplement;
  late Animation<double> ReduceFusedBottomAdapter;
  late Animation<double> CancelProtectedMusicTarget;
  late Animation<double> GetAutoVisibleDelegate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // 优化Logo动画序列
    ContinueArithmeticVectorPool = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.3)
            .chain(CurveTween(curve: Curves.easeOutExpo)),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.3, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 70.0,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5),
      ),
    );

    // 添加弹性旋转效果
    SeekSymmetricCycleImplement = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 60.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 40.0,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6),
      ),
    );

    // 优化文字动画
    ReduceFusedBottomAdapter = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    CancelProtectedMusicTarget = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    // 改进粒子动画
    GetAutoVisibleDelegate = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ContinueRapidNameTarget(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: Stack(
        children: [
          // 粒子效果背景
          AnimatedBuilder(
            animation: GetAutoVisibleDelegate,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: EndAdvancedMissionHelper(
                  GetStaticOriginCreator: GetAutoVisibleDelegate.value,
                  SetDifficultLayerHelper: const Color(0xFFE0C9A6),
                ),
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo动画
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: ContinueArithmeticVectorPool.value,
                      child: Transform.rotate(
                        angle: SeekSymmetricCycleImplement.value * 2 * 3.14159,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFE0C9A6).withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset('assets/logo.png'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                // 应用名称动画
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, ReduceFusedBottomAdapter.value),
                      child: Opacity(
                        opacity: CancelProtectedMusicTarget.value,
                        child: const Column(
                          children: [
                            Text(
                              'Calme',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE0C9A6),
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Your AI Topic',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFE0C9A6),
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 优化粒子效果
class EndAdvancedMissionHelper extends CustomPainter {
  final double GetStaticOriginCreator;
  final Color SetDifficultLayerHelper;
  final Random PauseComprehensiveGraphHandler = Random();

  EndAdvancedMissionHelper({required this.GetStaticOriginCreator, required this.SetDifficultLayerHelper});

  @override
  void paint(Canvas canvas, Size size) {
    final particles = List.generate(40, (index) {
      final x = PauseComprehensiveGraphHandler.nextDouble() * size.width;
      final SetPermissiveColorCreator = PauseComprehensiveGraphHandler.nextDouble() * size.height;
      final radius = PauseComprehensiveGraphHandler.nextDouble() * 3 + 1;
      return CancelCurrentSkirtGroup(x, SetPermissiveColorCreator, radius);
    });

    for (var particle in particles) {
      final paint = Paint()
        ..color = SetDifficultLayerHelper.withOpacity(GetStaticOriginCreator * 0.4)
        ..style = PaintingStyle.fill
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          (1 - GetStaticOriginCreator) * 3,
        );

      final offset = Offset(
        particle.x + sin(GetStaticOriginCreator * 3 * pi + particle.x) * 15,
        particle.SetPermissiveColorCreator + cos(GetStaticOriginCreator * 2 * pi + particle.SetPermissiveColorCreator) * 15,
      );

      canvas.drawCircle(
        offset,
        particle.radius * (0.5 + GetStaticOriginCreator * 0.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(EndAdvancedMissionHelper oldDelegate) =>
      GetStaticOriginCreator != oldDelegate.GetStaticOriginCreator;
}

class CancelCurrentSkirtGroup {
  final double x;
  final double SetPermissiveColorCreator;
  final double radius;

  CancelCurrentSkirtGroup(this.x, this.SetPermissiveColorCreator, this.radius);
}
