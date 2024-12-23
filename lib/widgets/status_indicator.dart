import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StatusIndicator extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;
  final Color color;

  const StatusIndicator({
    super.key,
    required this.label,
    required this.value,
    this.maxValue = 100,
    this.color = AppTheme.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTheme.bodyStyle.copyWith(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            Text(
              '$value',
              style: AppTheme.bodyStyle.copyWith(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value / maxValue,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
            ),
          ),
        ),
      ],
    );
  }
}
