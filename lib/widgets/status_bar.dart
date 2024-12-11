import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        final character = gameProvider.character;
        if (character == null) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${character.name} (${character.background})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '年龄: ${gameProvider.age}岁 | ${gameProvider.year}年',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAttributeDisplay('武力', character.military),
                  _buildAttributeDisplay('智谋', character.intelligence),
                  _buildAttributeDisplay('统帅', character.leadership),
                  _buildAttributeDisplay('政治', character.politics),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAttributeDisplay(String name, int value) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: value >= 8 ? Colors.red :
                   value >= 6 ? Colors.orange :
                   value >= 4 ? Colors.blue :
                   Colors.grey,
          ),
        ),
      ],
    );
  }
}
