import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../game_state_manager.dart';

class HistoryScreen extends StatelessWidget {
  final GameStateManager _gameState = GameStateManager();

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sceneHistory = _gameState.sceneHistory;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Story Review', style: TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.backgroundColor, Colors.white],
          ),
        ),
        child: sceneHistory.isEmpty
            ? const Center(
                child: Text(
                  'No story records yet~',
                  style: AppTheme.subtitleStyle,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: sceneHistory.length,
                itemBuilder: (context, index) {
                  final scene = sceneHistory[index];
                  final isLastItem = index == sceneHistory.length - 1;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 章节标题
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isLastItem
                                ? AppTheme.primaryColor.withOpacity(0.1)
                                : Colors.transparent,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isLastItem ? Icons.bookmark : Icons.history_edu,
                                color: isLastItem
                                    ? AppTheme.primaryColor
                                    : Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                isLastItem
                                    ? 'Current Scene'
                                    : 'Scene ${sceneHistory.length - index}',
                                style: AppTheme.subtitleStyle.copyWith(
                                  color: isLastItem
                                      ? AppTheme.primaryColor
                                      : Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 剧情内容
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            scene,
                            style: AppTheme.bodyStyle.copyWith(
                              height: 1.6,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        // 时间线指示器
                        if (!isLastItem)
                          Container(
                            margin: const EdgeInsets.only(left: 28),
                            width: 2,
                            height: 16,
                            color: Colors.grey[300],
                          ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
