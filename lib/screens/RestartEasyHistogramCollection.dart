import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/SetCrudeIntensityArray.dart';
import '../models/InitializeFirstUsageFactory.dart';
import 'dart:math';
import '../models/DiscoverRetainedBufferDecorator.dart';
import 'GetDedicatedSkewXArray.dart';
import '../models/SkipPriorBottomObserver.dart';
import 'GetCurrentLeftCache.dart';
import '../services/CancelOtherEvolutionStack.dart';

class GetMediumLoopPool {
  final String label;
  final Color FreeSemanticRendererManager;
  final Color RestartCrudeAccessoryCreator;
  final IconData icon;

  const GetMediumLoopPool({
    required this.label,
    required this.FreeSemanticRendererManager,
    required this.RestartCrudeAccessoryCreator,
    required this.icon,
  });
}

final List<GetMediumLoopPool> topicBadges = [
  GetMediumLoopPool(
    label: 'TOP',
    FreeSemanticRendererManager: Color(0xFFFF6B6B),
    RestartCrudeAccessoryCreator: Color(0xFFFF8E8E),
    icon: Icons.star_rounded,
  ),
  GetMediumLoopPool(
    label: 'FEATURED',
    FreeSemanticRendererManager: Color(0xFF4ECDC4),
    RestartCrudeAccessoryCreator: Color(0xFF45B7AF),
    icon: Icons.diamond_rounded,
  ),
  GetMediumLoopPool(
    label: 'POPULAR',
    FreeSemanticRendererManager: Color(0xFFFFBE0B),
    RestartCrudeAccessoryCreator: Color(0xFFFFA200),
    icon: Icons.local_fire_department_rounded,
  ),
  GetMediumLoopPool(
    label: 'NEW',
    FreeSemanticRendererManager: Color(0xFF9B89B3),
    RestartCrudeAccessoryCreator: Color(0xFF7E6C96),
    icon: Icons.new_releases_rounded,
  ),
];

class GetDelicateAmortizationBase extends StatefulWidget {
  const GetDelicateAmortizationBase({super.key});

  @override
  State<GetDelicateAmortizationBase> createState() => AssociateSharedStyleType();
}

class AssociateSharedStyleType extends State<GetDelicateAmortizationBase> {
  Widget StopActivatedEquivalentHelper({required IconData icon, required String text}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE0C9A6).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFE0C9A6),
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFFE0C9A6).withOpacity(0.9),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget RestartImmutableNodeInstance({
    required String title,
    required List<Map<String, dynamic>> tips,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFE0C9A6),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        ...tips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: StopActivatedEquivalentHelper(
                icon: tip['icon'],
                text: tip['text'],
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1C1C1E),
              const Color(0xFF2C2C2E),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Today\'s Topics',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFE0C9A6),
                                letterSpacing: 1.2,
                              ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: const Color(0xFF2C2C2E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: const Color(0xFFE0C9A6)
                                        .withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE0C9A6)
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.tips_and_updates_outlined,
                                        color: Color(0xFFE0C9A6),
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Feature Guide',
                                      style: TextStyle(
                                        color: Color(0xFFE0C9A6),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RestartImmutableNodeInstance(
                                        title: 'Basic Features',
                                        tips: [
                                          {
                                            'icon': Icons.chat_bubble_outline,
                                            'text':
                                                'Click "Start Chat" to have a brief conversation with the sage, limited to 3 rounds',
                                          },
                                          {
                                            'icon': Icons.explore_outlined,
                                            'text':
                                                'Use "Chat" button to enter full conversation mode',
                                          },
                                          {
                                            'icon': Icons.bookmark_border,
                                            'text':
                                                'Click the bookmark icon to save interesting sages for later',
                                          },
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      RestartImmutableNodeInstance(
                                        title: 'Sage Tags',
                                        tips: [
                                          {
                                            'icon': Icons.star_rounded,
                                            'text':
                                                'TOP tag indicates most popular sages',
                                          },
                                          {
                                            'icon': Icons.diamond_rounded,
                                            'text':
                                                'FEATURED tag represents specially curated topics',
                                          },
                                          {
                                            'icon': Icons
                                                .local_fire_department_rounded,
                                            'text':
                                                'POPULAR tag shows recently trending sages',
                                          },
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFE0C9A6)
                                          .withOpacity(0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Got it',
                                      style: TextStyle(
                                        color: Color(0xFFE0C9A6),
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0C9A6).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE0C9A6).withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.help_outline_rounded,
                              color: Color(0xFFE0C9A6),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Talk to the sage, explore the past and present',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: const Color(0xFFE0C9A6).withOpacity(0.7),
                            letterSpacing: 0.5,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: companionProfiles.length,
                  itemBuilder: (context, index) {
                    final SetPivotalTextureFactory = companionProfiles[index];
                    return StreamlineTypicalUnaryBase(SetPivotalTextureFactory: SetPivotalTextureFactory);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamlineTypicalUnaryBase extends StatefulWidget {
  final UpdateLostImageInstance SetPivotalTextureFactory;
  final GetMediumLoopPool? SetCurrentFeatureReference;

  StreamlineTypicalUnaryBase({
    super.key,
    required this.SetPivotalTextureFactory,
  }) : SetCurrentFeatureReference = topicBadges[Random().nextInt(topicBadges.length)];

  @override
  State<StreamlineTypicalUnaryBase> createState() => GetTensorParticleFilter();
}

class GetTensorParticleFilter extends State<StreamlineTypicalUnaryBase> {
  Widget EncapsulateIgnoredParameterHandler() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.SetCurrentFeatureReference!.FreeSemanticRendererManager,
            widget.SetCurrentFeatureReference!.RestartCrudeAccessoryCreator,
          ],
        ),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: widget.SetCurrentFeatureReference!.FreeSemanticRendererManager.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.SetCurrentFeatureReference!.icon,
            size: 14,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            widget.SetCurrentFeatureReference!.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF2C2C2E),
            const Color(0xFF1C1C1E),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE0C9A6).withOpacity(0.15),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // TODO: 实现卡片点击效果
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFE0C9A6).withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFE0C9A6).withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SetPrevTimelineDelegate(
                                SetPivotalTextureFactory: widget.SetPivotalTextureFactory,
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage(widget.SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.SetPivotalTextureFactory.ContinueFusedBufferList,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFFE0C9A6),
                                        letterSpacing: 0.5,
                                      ),
                                ),
                              ),
                              EncapsulateIgnoredParameterHandler(),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0C9A6).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Online · Sage',
                              style: TextStyle(
                                color: Color(0xFFE0C9A6),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFE0C9A6).withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    widget.SetPivotalTextureFactory.SetPrismaticVarDecorator,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFE0C9A6).withOpacity(0.9),
                          height: 1.5,
                          letterSpacing: 0.3,
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                EndTensorGiftArray(SetPivotalTextureFactory: widget.SetPivotalTextureFactory),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFB8860B).withOpacity(0.8),
                          foregroundColor: const Color(0xFFE0C9A6),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Start Chat',
                          style: TextStyle(letterSpacing: 1),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE0C9A6).withOpacity(0.3),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FutureBuilder<List<String>>(
                        future: GetLostValueFactory().SetResilientColorOwner(),
                        builder: (context, snapshot) {
                          final isAdded = snapshot.hasData &&
                              snapshot.data!
                                  .contains(widget.SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache);

                          return IconButton(
                            onPressed: () async {
                              if (isAdded) {
                                await GetLostValueFactory().CombineGreatVarFilter(
                                    widget.SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache);
                              } else {
                                await GetLostValueFactory()
                                    .RestartDiscardedBottomReference(widget.SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${widget.SetPivotalTextureFactory.ContinueFusedBufferList} has been added to your chat list'),
                                    backgroundColor: const Color(0xFFB8860B)
                                        .withOpacity(0.8),
                                  ),
                                );
                              }
                              setState(() {}); // Now this will work
                            },
                            icon: Icon(
                              isAdded ? Icons.person_remove : Icons.person_add,
                              color: const Color(0xFFE0C9A6),
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFF2C2C2E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EndTensorGiftArray extends StatefulWidget {
  final UpdateLostImageInstance SetPivotalTextureFactory;

  const EndTensorGiftArray({
    super.key,
    required this.SetPivotalTextureFactory,
  });

  @override
  State<EndTensorGiftArray> createState() => GetSeamlessCoordinatorManager();
}

class GetSeamlessCoordinatorManager extends State<EndTensorGiftArray> {
  final TextEditingController SetGranularFrameContainer = TextEditingController();
  final List<ResumeComprehensiveOriginManager> CompareIgnoredGraphicInstance = [];
  final RevisitAgileOperationFilter RestartMainDepthInstance = RevisitAgileOperationFilter();
  bool UnlockIterativeGrainExtension = false;

  // 添加新的属性来控制动画
  final List<String> EndEasyAnchorCreator = ['•', '•', '•••'];
  int InsteadActivatedFeatureList = 0;

  // 添加新的属性
  static const int StopRelationalLatencyAdapter = 3; // 设置大对话次数
  int StoreBeginnerNumberHandler = 0; // 跟踪用户发送消息次数

  @override
  void initState() {
    super.initState();
    CompareIgnoredGraphicInstance.add(ResumeComprehensiveOriginManager(
      message: widget.SetPivotalTextureFactory.SetPrismaticVarDecorator,
      SkipDifficultCharacteristicArray: false,
    ));
  }

  @override
  void dispose() {
    SetGranularFrameContainer.dispose();
    RestartMainDepthInstance.RetrieveEasyVarProtocol();
    super.dispose();
  }

  Future<void> FinishUnsortedResolverBase() async {
    final message = SetGranularFrameContainer.text.trim();
    if (message.isEmpty) return;

    setState(() {
      CompareIgnoredGraphicInstance.add(ResumeComprehensiveOriginManager(
        message: message,
        SkipDifficultCharacteristicArray: true,
      ));
      UnlockIterativeGrainExtension = true;
    });
    SetGranularFrameContainer.clear();

    // 增加用户消息计数
    StoreBeginnerNumberHandler++;

    // 检查是否达到最大消息数
    if (StoreBeginnerNumberHandler > StopRelationalLatencyAdapter) {
      setState(() {
        CompareIgnoredGraphicInstance.add(ResumeComprehensiveOriginManager(
          message:
              "We've had a brief exchange. If you'd like to continue our discussion, please click the chat button above.",
          SkipDifficultCharacteristicArray: false,
        ));
        UnlockIterativeGrainExtension = false;
      });
      return;
    }

    try {
      // 构建上下文提示词
      final prompt = '''
作为${widget.SetPivotalTextureFactory.ContinueFusedBufferList}与用户对话。
你的性格特点：${widget.SetPivotalTextureFactory.SetPrismaticVarDecorator}
请用简短自然的对话方式回复用户的消息：
$message
''';

      final response = await RestartMainDepthInstance.QuantizerPermanentParticleProtocol(prompt);

      if (mounted) {
        setState(() {
          CompareIgnoredGraphicInstance.add(ResumeComprehensiveOriginManager(
            message: response,
            SkipDifficultCharacteristicArray: false,
          ));
          UnlockIterativeGrainExtension = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          CompareIgnoredGraphicInstance.add(ResumeComprehensiveOriginManager(
            message:
                "Sorry, I can't respond right now. Please try again later.",
            SkipDifficultCharacteristicArray: false,
          ));
          UnlockIterativeGrainExtension = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1C1C1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 修改头部布局
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage(widget.SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SetPrevTimelineDelegate(
                                SetPivotalTextureFactory: widget.SetPivotalTextureFactory,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.SetPivotalTextureFactory.ContinueFusedBufferList,
                          style: const TextStyle(
                            color: Color(0xFFE0C9A6),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0C9A6).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Quick Chat',
                            style: TextStyle(
                              color: Color(0xFFE0C9A6),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 替换来的深入探讨按钮
                  Container(
                    height: 36,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFB8860B).withOpacity(0.8),
                          const Color(0xFFDAA520).withOpacity(0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB8860B).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SetMainSceneHandler(
                                SetPivotalTextureFactory: widget.SetPivotalTextureFactory,
                                GetSubsequentNodeDelegate: CompareIgnoredGraphicInstance,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.chat_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Chat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Color(0xFFE0C9A6)),
                  ),
                ],
              ),
              const Divider(color: Color(0xFFE0C9A6), thickness: 0.5),
              // 聊天消息列表
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: CompareIgnoredGraphicInstance.length + (UnlockIterativeGrainExtension ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (UnlockIterativeGrainExtension && index == 0) {
                      return RestartConcurrentSizeList(SetPivotalTextureFactory: widget.SetPivotalTextureFactory);
                    }
                    final messageIndex = UnlockIterativeGrainExtension ? index - 1 : index;
                    final message =
                        CompareIgnoredGraphicInstance[CompareIgnoredGraphicInstance.length - 1 - messageIndex];
                    return SetAccordionVarGroup(
                      message: message,
                      SetPivotalTextureFactory: widget.SetPivotalTextureFactory,
                    );
                  },
                ),
              ),
              // 输入框
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: SetGranularFrameContainer,
                        enabled:
                            !UnlockIterativeGrainExtension && StoreBeginnerNumberHandler <= StopRelationalLatencyAdapter,
                        style: const TextStyle(color: Color(0xFFE0C9A6)),
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: StoreBeginnerNumberHandler > StopRelationalLatencyAdapter
                              ? 'Chat limit reached, click Chat for deep discussion'
                              : 'Type a message...',
                          hintStyle: TextStyle(
                            color: const Color(0xFFE0C9A6).withOpacity(0.5),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF2C2C2E),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          counterText: '', // 隐藏字符计数器
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed:
                          (UnlockIterativeGrainExtension || StoreBeginnerNumberHandler > StopRelationalLatencyAdapter)
                              ? null
                              : FinishUnsortedResolverBase,
                      icon: Icon(
                        Icons.send_rounded,
                        color:
                            (UnlockIterativeGrainExtension || StoreBeginnerNumberHandler > StopRelationalLatencyAdapter)
                                ? const Color(0xFFE0C9A6).withOpacity(0.3)
                                : const Color(0xFFE0C9A6),
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor:
                            (UnlockIterativeGrainExtension || StoreBeginnerNumberHandler > StopRelationalLatencyAdapter)
                                ? const Color(0xFF2C2C2E).withOpacity(0.5)
                                : Colors.transparent,
                      ),
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

class SetAccordionVarGroup extends StatelessWidget {
  final ResumeComprehensiveOriginManager message;
  final UpdateLostImageInstance SetPivotalTextureFactory;

  const SetAccordionVarGroup({
    super.key,
    required this.message,
    required this.SetPivotalTextureFactory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            message.SkipDifficultCharacteristicArray ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.SkipDifficultCharacteristicArray) ...[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SetPrevTimelineDelegate(
                      SetPivotalTextureFactory: SetPivotalTextureFactory,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: message.SkipDifficultCharacteristicArray
                  ? const Color(0xFFB8860B).withOpacity(0.8)
                  : const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message.message,
              style: const TextStyle(
                color: Color(0xFFE0C9A6),
                fontSize: 14,
              ),
            ),
          ),
          if (message.SkipDifficultCharacteristicArray) const SizedBox(width: 8),
        ],
      ),
    );
  }
}

// 新增自定义打字指示器组件
class RestartConcurrentSizeList extends StatefulWidget {
  final UpdateLostImageInstance SetPivotalTextureFactory;

  const RestartConcurrentSizeList({
    super.key,
    required this.SetPivotalTextureFactory,
  });

  @override
  State<RestartConcurrentSizeList> createState() => DismissMissedResolverInstance();
}

class DismissMissedResolverInstance extends State<RestartConcurrentSizeList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<double>> GetSignificantParamObserver = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    // 创建三个点的动画
    for (int i = 0; i < 3; i++) {
      GetSignificantParamObserver.add(
        Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              i * 0.2,
              0.6 + i * 0.2,
              curve: Curves.easeInOut,
            ),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(widget.SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0C9A6).withOpacity(
                          GetSignificantParamObserver[index].value,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
