import 'package:flutter/material.dart';

class AttributeSlider extends StatelessWidget {
  final String attributeName;
  final int value;
  final Function(int) onChanged;
  final int maxValue;

  const AttributeSlider({
    super.key,
    required this.attributeName,
    required this.value,
    required this.onChanged,
    this.maxValue = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$attributeName: $value'),
        Slider(
          value: value.toDouble(),
          min: 0,
          max: maxValue.toDouble(),
          divisions: maxValue,
          onChanged: (double newValue) {
            onChanged(newValue.round());
          },
        ),
      ],
    );
  }
}
