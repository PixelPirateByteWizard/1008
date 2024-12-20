import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'state_manager.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final history = gameState.eventHistory;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        foregroundColor: Colors.white,
        title: const Text(
          '历史记录',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/paper_texture.png'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: history.isEmpty
            ? const Center(
                child: Text(
                  '暂无历史记录',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final entry = history[index];
                  final isLatest = index == history.length - 1;
                  return HistoryItem(
                    entry: entry,
                    index: index + 1,
                    isLatest: isLatest,
                  );
                },
              ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final HistoryEntry entry;
  final int index;
  final bool isLatest;

  const HistoryItem({
    super.key,
    required this.entry,
    required this.index,
    required this.isLatest,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MM-dd HH:mm');

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: isLatest
              ? const Color(0xFF8B0000).withOpacity(0.1)
              : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isLatest
                ? const Color(0xFF8B0000).withOpacity(0.3)
                : Colors.brown.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isLatest
                          ? const Color(0xFF8B0000)
                          : Colors.brown.shade700,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$index',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.action,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isLatest
                                ? const Color(0xFF8B0000)
                                : Colors.brown.shade900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          entry.scene,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.brown.shade700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dateFormat.format(entry.timestamp),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
