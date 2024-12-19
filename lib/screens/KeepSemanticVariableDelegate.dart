import 'package:flutter/material.dart';
import 'dart:ui';
import '../models/InitializeFirstUsageFactory.dart';
import '../models/DiscoverRetainedBufferDecorator.dart';
import '../models/SkipPriorBottomObserver.dart';
import '../screens/TransposeDiscardedCenterFilter.dart';

class FinishSubstantialLoopReference extends StatefulWidget {
  final UpdateLostImageInstance SetPivotalTextureFactory;
  final String SetSemanticScaleType;

  const FinishSubstantialLoopReference({
    super.key,
    required this.SetPivotalTextureFactory,
    required this.SetSemanticScaleType,
  });

  @override
  State<FinishSubstantialLoopReference> createState() => StartMediumThroughputCreator();
}

class StartMediumThroughputCreator extends State<FinishSubstantialLoopReference> {
  final TextEditingController SetGranularFrameContainer = TextEditingController();
  final List<ResumeComprehensiveOriginManager> CompareIgnoredGraphicInstance = [];
  final RevisitAgileOperationFilter RestartMainDepthInstance = RevisitAgileOperationFilter();
  bool UnlockIterativeGrainExtension = false;

  @override
  void initState() {
    super.initState();
    SetGeometricEvaluationGroup();
  }

  void SetGeometricEvaluationGroup() {
    setState(() {
      CompareIgnoredGraphicInstance.add(ResumeComprehensiveOriginManager(
        message: "Let's discuss: ${widget.SetSemanticScaleType}",
        SkipDifficultCharacteristicArray: false,
      ));
    });
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

    try {
      final prompt = '''
Discussion with ${widget.SetPivotalTextureFactory.ContinueFusedBufferList} about: ${widget.SetSemanticScaleType}
Your personality traits: ${widget.SetPivotalTextureFactory.SetPrismaticVarDecorator}
Please respond to the user's message naturally:
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: const Color(0xFF1C1C1E).withOpacity(0.7),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFE0C9A6)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              GetUniformValueInstance(),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.SetPivotalTextureFactory.ContinueFusedBufferList,
                    style: const TextStyle(
                      color: Color(0xFFE0C9A6),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'In Discussion...',
                    style: TextStyle(
                      color: const Color(0xFFE0C9A6).withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.videocam_outlined,
                color: Color(0xFFE0C9A6),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetachPublicSymbolArray(
                      SetPivotalTextureFactory: widget.SetPivotalTextureFactory,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: Color(0xFFE0C9A6),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => SetAccessibleCapsuleReference(),
                );
              },
            ),
          ],
        ),
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
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  itemCount: CompareIgnoredGraphicInstance.length + (UnlockIterativeGrainExtension ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (UnlockIterativeGrainExtension && index == 0) {
                      return DissociateProtectedRightAdapter();
                    }
                    final messageIndex = UnlockIterativeGrainExtension ? index - 1 : index;
                    final message =
                        CompareIgnoredGraphicInstance[CompareIgnoredGraphicInstance.length - 1 - messageIndex];
                    return GetMediumFrameCache(message);
                  },
                ),
              ),
              SetPublicTempleCollection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget GetUniformValueInstance() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFE0C9A6).withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE0C9A6).withOpacity(0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(widget.SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
      ),
    );
  }

  Widget GetMediumFrameCache(ResumeComprehensiveOriginManager message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            message.SkipDifficultCharacteristicArray ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.SkipDifficultCharacteristicArray) ...[
            GetUniformValueInstance(),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: message.SkipDifficultCharacteristicArray
                      ? [
                          const Color(0xFFB8860B).withOpacity(0.9),
                          const Color(0xFFB8860B).withOpacity(0.7),
                        ]
                      : [
                          const Color(0xFF2C2C2E).withOpacity(0.9),
                          const Color(0xFF2C2C2E).withOpacity(0.7),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20).copyWith(
                  bottomLeft: Radius.circular(!message.SkipDifficultCharacteristicArray ? 0 : 20),
                  bottomRight: Radius.circular(message.SkipDifficultCharacteristicArray ? 0 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.message,
                style: TextStyle(
                  color: const Color(0xFFE0C9A6),
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DissociateProtectedRightAdapter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          GetUniformValueInstance(),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0C9A6).withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget SetPublicTempleCollection() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E).withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFFE0C9A6).withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            color: const Color(0xFFE0C9A6).withOpacity(0.7),
            onPressed: () {
              // TODO: Implement emoji picker
            },
          ),
          Expanded(
            child: TextField(
              controller: SetGranularFrameContainer,
              style: const TextStyle(color: Color(0xFFE0C9A6)),
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Send a message...',
                hintStyle: TextStyle(
                  color: const Color(0xFFE0C9A6).withOpacity(0.5),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(
            onPressed: UnlockIterativeGrainExtension ? null : FinishUnsortedResolverBase,
            icon: const Icon(Icons.send_rounded),
            color: UnlockIterativeGrainExtension
                ? const Color(0xFFE0C9A6).withOpacity(0.5)
                : const Color(0xFFE0C9A6),
          ),
        ],
      ),
    );
  }

  Widget SetAccessibleCapsuleReference() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE0C9A6).withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.delete_outline,
                    color: const Color(0xFFE0C9A6).withOpacity(0.8),
                  ),
                  title: Text(
                    'Clear Chat History',
                    style: TextStyle(
                      color: const Color(0xFFE0C9A6).withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    // TODO: Implement clear chat history
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.block_outlined,
                    color: const Color(0xFFE0C9A6).withOpacity(0.8),
                  ),
                  title: Text(
                    'Block Companion',
                    style: TextStyle(
                      color: const Color(0xFFE0C9A6).withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    // TODO: Implement block SetPivotalTextureFactory
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.report_outlined,
                    color: const Color(0xFFE0C9A6).withOpacity(0.8),
                  ),
                  title: Text(
                    'Report Issue',
                    style: TextStyle(
                      color: const Color(0xFFE0C9A6).withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    // TODO: Implement report issue
                    Navigator.pop(context);
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
