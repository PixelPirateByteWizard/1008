import 'package:flutter/material.dart';

class ResourceBar extends StatelessWidget {
  final int gold;
  final int food;
  final int troops;
  final int reputation;
  final Map<String, String> labels;

  const ResourceBar({
    super.key,
    required this.gold,
    required this.food,
    required this.troops,
    required this.reputation,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ResourceItem(
            icon: Icons.monetization_on,
            value: gold,
            label: labels['gold'] ?? '',
            color: Colors.amber,
          ),
          ResourceItem(
            icon: Icons.grain,
            value: food,
            label: labels['food'] ?? '',
            color: Colors.green,
          ),
          ResourceItem(
            icon: Icons.people,
            value: troops,
            label: labels['troops'] ?? '',
            color: Colors.red,
          ),
          ResourceItem(
            icon: Icons.star,
            value: reputation,
            label: labels['reputation'] ?? '',
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class ResourceItem extends StatelessWidget {
  final IconData icon;
  final int value;
  final String label;
  final Color color;

  const ResourceItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24, color: color),
        const SizedBox(height: 4),
        Text(
          '$value',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class SceneDescription extends StatelessWidget {
  final String text;

  const SceneDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class ActionList extends StatelessWidget {
  final List<String> actions;
  final void Function(String) onActionSelected;

  const ActionList({
    super.key,
    required this.actions,
    required this.onActionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actions
          .map((action) => ActionButton(
                action: action,
                onPressed: () => onActionSelected(action),
              ))
          .toList(),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String action;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.action,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B0000),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
        ),
        child: Text(
          action,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
