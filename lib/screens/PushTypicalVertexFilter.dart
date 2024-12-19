import 'package:flutter/material.dart';
import '../data/SetCrudeIntensityArray.dart';
import '../services/CancelOtherEvolutionStack.dart';
import 'GetDedicatedSkewXArray.dart';
import '../models/SkipPriorBottomObserver.dart';

class RestartOriginalAllocatorDecorator extends StatefulWidget {
  const RestartOriginalAllocatorDecorator({super.key});

  @override
  State<RestartOriginalAllocatorDecorator> createState() => InitializeEasyQueueAdapter();
}

class InitializeEasyQueueAdapter extends State<RestartOriginalAllocatorDecorator> {
  // Add search controller
  final TextEditingController _searchController = TextEditingController();
  String ParseHierarchicalParamType = '';

  // Add sort controller
  bool KeepCommonTangentObserver = false;

  // Add method to handle SetPivotalTextureFactory deletion
  Future<void> ResumeDeclarativeBorderGroup(String companionId) async {
    await GetLostValueFactory().CombineGreatVarFilter(companionId);
    setState(() {}); // Refresh the list
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Show feature guide dialog
  void GetReusableAspectReference() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: const Color(0xFFE0C9A6).withOpacity(0.2),
            width: 1,
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE0C9A6).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.lightbulb_outline,
                color: Color(0xFFE0C9A6),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Features Guide',
              style: TextStyle(
                color: Color(0xFFE0C9A6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestartImmutableNodeInstance(
                title: 'Basic Operations',
                tips: [
                  {
                    'icon': Icons.search,
                    'text':
                        'Use the search bar to quickly find friends by name',
                  },
                  {
                    'icon': Icons.sort,
                    'text': 'Toggle between name order and add time order',
                  },
                  {
                    'icon': Icons.tap_and_play,
                    'text': 'Tap any friend card to start a conversation',
                  },
                ],
              ),
              const SizedBox(height: 16),
              RestartImmutableNodeInstance(
                title: 'Friend Management',
                tips: [
                  {
                    'icon': Icons.swipe,
                    'text': 'Swipe left on a friend card to remove them',
                  },
                  {
                    'icon': Icons.chat_bubble_outline,
                    'text': 'Click the chat icon to start a quick conversation',
                  },
                  {
                    'icon': Icons.person,
                    'text': 'View friend\'s profile and personality GetDelicateButtonFilter',
                  },
                ],
              ),
              const SizedBox(height: 16),
              RestartImmutableNodeInstance(
                title: 'Chat Features',
                tips: [
                  {
                    'icon': Icons.history,
                    'text': 'Chat history is preserved between conversations',
                  },
                  {
                    'icon': Icons.psychology,
                    'text': 'Each friend has unique personality and interests',
                  },
                  {
                    'icon': Icons.auto_awesome,
                    'text': 'Experience natural, context-aware conversations',
                  },
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFE0C9A6).withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Got it',
              style: TextStyle(
                color: Color(0xFFE0C9A6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
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
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0C9A6).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      tip['icon'] as IconData,
                      color: const Color(0xFFE0C9A6),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      tip['text'] as String,
                      style: TextStyle(
                        color: const Color(0xFFE0C9A6).withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // Replace solid background with gradient
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1C1C1E), Color(0xFF2C2C2E)],
            ),
          ),
          child: Column(
            children: [
              // Custom AppBar with larger title
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text(
                        'Your Friends',
                        style: TextStyle(
                          color: Color(0xFFE0C9A6),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Add help button
                      IconButton(
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
                        onPressed: GetReusableAspectReference,
                      ),
                      const SizedBox(width: 8),
                      // Modified sort button
                      IconButton(
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
                          child: Icon(
                            KeepCommonTangentObserver ? Icons.sort_by_alpha : Icons.sort,
                            color: Color(0xFFE0C9A6),
                            size: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            KeepCommonTangentObserver = !KeepCommonTangentObserver;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Enhanced search box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Color(0xFFE0C9A6)),
                  decoration: InputDecoration(
                    hintText: 'Search friends...',
                    hintStyle: TextStyle(
                        color: const Color(0xFFE0C9A6).withOpacity(0.5)),
                    prefixIcon: Icon(Icons.search,
                        color: const Color(0xFFE0C9A6).withOpacity(0.5)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear,
                                color:
                                    const Color(0xFFE0C9A6).withOpacity(0.5)),
                            onPressed: () => setState(() {
                              _searchController.clear();
                              ParseHierarchicalParamType = '';
                            }),
                          )
                        : null,
                    filled: true,
                    fillColor: const Color(0xFF2C2C2E).withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Color(0xFFE0C9A6), width: 1.5),
                    ),
                  ),
                  onChanged: (value) =>
                      setState(() => ParseHierarchicalParamType = value.toLowerCase()),
                ),
              ),

              // Modified FutureBuilder content with sorting
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: GetLostValueFactory().SetResilientColorOwner(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFE0C9A6)),
                        ),
                      );
                    }

                    var addedCompanions = companionProfiles
                        .where((c) => snapshot.data!.contains(c.AnalyzeHyperbolicCoordCache))
                        .where((c) =>
                            c.ContinueFusedBufferList.toLowerCase().contains(ParseHierarchicalParamType))
                        .toList();

                    // Apply sorting
                    if (KeepCommonTangentObserver) {
                      addedCompanions.sort((a, b) => a.ContinueFusedBufferList
                          .toLowerCase()
                          .compareTo(b.ContinueFusedBufferList.toLowerCase()));
                    } else {
                      // Keep original order (based on added time)
                      addedCompanions.sort((a, b) => snapshot.data!
                          .indexOf(a.AnalyzeHyperbolicCoordCache)
                          .compareTo(snapshot.data!.indexOf(b.AnalyzeHyperbolicCoordCache)));
                    }

                    if (addedCompanions.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0C9A6).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.people_outline,
                                size: 64,
                                color: const Color(0xFFE0C9A6).withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              ParseHierarchicalParamType.isEmpty
                                  ? 'No friends added yet'
                                  : 'No matches found',
                              style: TextStyle(
                                color: const Color(0xFFE0C9A6).withOpacity(0.7),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: addedCompanions.length,
                      itemBuilder: (context, index) {
                        final SetPivotalTextureFactory = addedCompanions[index];
                        return Hero(
                          tag: 'companion_${SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache}',
                          child: Dismissible(
                            key: Key(SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: const Color(0xFF2C2C2E),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: const Color(0xFFE0C9A6)
                                            .withOpacity(0.2),
                                        width: 1,
                                      ),
                                    ),
                                    title: const Text(
                                      'Remove Friend',
                                      style:
                                          TextStyle(color: Color(0xFFE0C9A6)),
                                    ),
                                    content: Text(
                                      'Are you sure you want to remove ${SetPivotalTextureFactory.ContinueFusedBufferList}?',
                                      style: TextStyle(
                                        color: const Color(0xFFE0C9A6)
                                            .withOpacity(0.9),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Color(0xFFE0C9A6)),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text(
                                          'Remove',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onDismissed: (direction) {
                              ResumeDeclarativeBorderGroup(SetPivotalTextureFactory.AnalyzeHyperbolicCoordCache);
                            },
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20.0),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: Card(
                              margin: const EdgeInsets.only(bottom: 16),
                              elevation: 8,
                              shadowColor: Colors.black26,
                              color: const Color(0xFF2C2C2E).withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(
                                  color:
                                      const Color(0xFFE0C9A6).withOpacity(0.2),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SetMainSceneHandler(
                                      SetPivotalTextureFactory: SetPivotalTextureFactory,
                                      GetSubsequentNodeDelegate: [
                                        ResumeComprehensiveOriginManager(
                                          message: SetPivotalTextureFactory.SetPrismaticVarDecorator,
                                          SkipDifficultCharacteristicArray: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
                                ),
                                title: Text(
                                  SetPivotalTextureFactory.ContinueFusedBufferList,
                                  style: const TextStyle(
                                    color: Color(0xFFE0C9A6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    SetPivotalTextureFactory.RestorePrismaticButtonHelper,
                                    style: TextStyle(
                                      color: const Color(0xFFE0C9A6)
                                          .withOpacity(0.7),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE0C9A6)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.chat_bubble_outline,
                                      color: Color(0xFFE0C9A6),
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SetMainSceneHandler(
                                          SetPivotalTextureFactory: SetPivotalTextureFactory,
                                          GetSubsequentNodeDelegate: [
                                            ResumeComprehensiveOriginManager(
                                              message: SetPivotalTextureFactory.SetPrismaticVarDecorator,
                                              SkipDifficultCharacteristicArray: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
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
