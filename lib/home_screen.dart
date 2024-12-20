import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state_manager.dart';
import 'widgets.dart';
import 'constants.dart';
import 'SGMessageService.dart';
import 'storage_service.dart';
import 'dart:convert';
import 'prompt_builder.dart';
import 'dart:developer' as developer;
import 'history_screen.dart';
import 'SGMessageService.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final SGMessageService _aiMessageService = SGMessageService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  Future<void> _initializeGame() async {
    try {
      // 检查当前状态
      final currentState = ref.read(gameStateProvider);
      if (currentState.gold == 0 && currentState.food == 0) {
        // 如果状态为0，重新初始化
        ref.read(gameStateProvider.notifier).setState(const GameState(
              gold: GameConstants.initialGold,
              food: GameConstants.initialFood,
              troops: GameConstants.initialTroops,
              reputation: GameConstants.initialReputation,
            ));
      }

      // 尝试加载存档
      final savedState = await StorageService.loadGame();
      if (savedState != null && mounted) {
        ref.read(gameStateProvider.notifier).setState(savedState);
      }

      // 设置初始场景
      if (mounted) {
        ref.read(gameStateProvider.notifier).setScene(
              GameConstants.initialScene,
              GameConstants.initialActions,
            );
      }

      // 添加调试日志
      final newState = ref.read(gameStateProvider);
      developer.log(
        '游戏初始化状态: gold=${newState.gold}, food=${newState.food}, troops=${newState.troops}, reputation=${newState.reputation}',
      );
    } catch (e) {
      developer.log('初始化游戏时出错: $e', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('初始化游戏时出错: $e')),
        );
      }
    }
  }

  Future<void> _handleAction(String action) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final gameState = ref.read(gameStateProvider);

      // 使用 PromptBuilder 构建提示
      final prompt = PromptBuilder.buildGamePrompt(gameState, action);

      // 调用AI接口
      final response = await _aiMessageService.processUserMessage(prompt);

      // 解析响应
      final parts = response.split('###');
      String scene = '';
      Map<String, int> results = {};
      List<String> newActions = [];

      for (var part in parts) {
        final trimmedPart = part.trim();
        if (trimmedPart.startsWith('场景描述')) {
          scene = trimmedPart.replaceFirst('场景描述', '').trim();
        } else if (trimmedPart.startsWith('事件结果')) {
          try {
            // 修改解析逻辑，直接查找 JSON 对象
            final jsonMatch = RegExp(r'\{[\s\S]*?\}').firstMatch(trimmedPart);
            if (jsonMatch != null) {
              final jsonStr = jsonMatch.group(0)!;
              final jsonResult = jsonDecode(jsonStr);

              // 获取当前状态
              final currentState = ref.read(gameStateProvider);

              // 计算新的资源值（加上当前值）
              results = {
                'gold': (currentState.gold + (jsonResult['金钱'] as num).toInt())
                    .clamp(GameConstants.minGold, GameConstants.maxGold),
                'food': (currentState.food + (jsonResult['粮草'] as num).toInt())
                    .clamp(GameConstants.minFood, GameConstants.maxFood),
                'troops': (currentState.troops +
                        (jsonResult['兵力'] as num).toInt())
                    .clamp(GameConstants.minTroops, GameConstants.maxTroops),
                'reputation': (currentState.reputation +
                        (jsonResult['声望'] as num).toInt())
                    .clamp(GameConstants.minReputation,
                        GameConstants.maxReputation),
              };

              // 打印调试信息
              developer.log('当前状态: $currentState');
              developer.log('AI返回的变化值: $jsonResult');
              developer.log('计算后的新状态: $results');
            }
          } catch (e) {
            developer.log('解析事件结果出错: $e', error: e);
            // 如果解析出错，保持当前状态
            final currentState = ref.read(gameStateProvider);
            results = {
              'gold': currentState.gold,
              'food': currentState.food,
              'troops': currentState.troops,
              'reputation': currentState.reputation,
            };
          }
        } else if (trimmedPart.startsWith('新的可选行动列表')) {
          newActions = trimmedPart
              .split('\n')
              .where((line) => line.trim().startsWith(RegExp(r'\d\.')))
              .map((line) {
                final match = RegExp(r'\d\.\s*\*\*(.*?)\*\*').firstMatch(line);
                return match?.group(1)?.trim() ??
                    line.replaceFirst(RegExp(r'\d\.\s*'), '').trim();
              })
              .where((action) => action.isNotEmpty)
              .toList();
        }
      }

      // 确保有结果值并更新状态
      if (results.isNotEmpty && mounted) {
        // 更新游戏状态
        ref.read(gameStateProvider.notifier).updateResources(
              gold: results['gold'],
              food: results['food'],
              troops: results['troops'],
              reputation: results['reputation'],
            );

        // 更新场景和动作
        if (scene.isNotEmpty && newActions.isNotEmpty) {
          ref.read(gameStateProvider.notifier)
            ..setScene(scene, newActions)
            ..addToHistory(action, scene);
        }

        // 打印更新后的状态
        final newState = ref.read(gameStateProvider);
        developer.log(
          '状态更新后: gold=${newState.gold}, food=${newState.food}, troops=${newState.troops}, reputation=${newState.reputation}',
        );

        // 自动保存
        await StorageService.saveGame(newState);
      }
    } catch (e) {
      developer.log('处理动作时出错: $e', error: e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('发生错误: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _saveGame() async {
    try {
      await StorageService.saveGame(ref.read(gameStateProvider));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('游戏已保存')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('保存失败: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        foregroundColor: Colors.white,
        title: const Text(
          '军师别坑我',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
              );
            },
            tooltip: '历史记录',
          ),
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: _saveGame,
            tooltip: '保存进度',
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          // 添加古卷轴纹理背景
          image: DecorationImage(
            image: AssetImage('assets/images/paper_texture.png'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.brown.shade900.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ResourceBar(
                    gold: gameState.gold,
                    food: gameState.food,
                    troops: gameState.troops,
                    reputation: gameState.reputation,
                  ),
                  // 添加历史记录入口按钮
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const HistoryScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.brown.shade800,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.history,
                                color: Colors.white70,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '历史记录',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${gameState.eventHistory.length} 条记录',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SceneDescription(text: gameState.currentScene),
                    const SizedBox(height: 24),
                    if (_isLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF8B0000)),
                        ),
                      )
                    else
                      ActionList(
                        actions: gameState.availableActions,
                        onActionSelected: _handleAction,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
