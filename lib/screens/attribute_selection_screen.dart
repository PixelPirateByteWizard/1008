import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/attribute_slider.dart';
import '../models/character.dart';
import '../data/characters_data.dart';
import '../providers/game_provider.dart';
import 'dart:math';

class AttributeSelectionScreen extends StatefulWidget {
  const AttributeSelectionScreen({super.key});

  @override
  State<AttributeSelectionScreen> createState() =>
      _AttributeSelectionScreenState();
}

class _AttributeSelectionScreenState extends State<AttributeSelectionScreen> {
  int remainingPoints = 20;
  final TextEditingController _nameController = TextEditingController();
  String selectedBackground = '平民';

  Map<String, int> attributes = {
    '武力': 0,
    '智谋': 0,
    '统帅': 0,
    '政治': 0,
  };

  void _randomizeAttributes() {
    setState(() {
      remainingPoints = 0;
      List<int> points = List.generate(4, (_) => 0);
      int totalPoints = 20;

      for (int i = 0; i < totalPoints; i++) {
        int index = Random().nextInt(4);
        if (points[index] < 10) {
          points[index]++;
        } else {
          i--;
        }
      }

      var keys = attributes.keys.toList();
      for (int i = 0; i < keys.length; i++) {
        attributes[keys[i]] = points[i];
      }
    });
  }

  void _updateAttribute(String attribute, int value) {
    final int oldValue = attributes[attribute]!;
    final int pointDifference = value - oldValue;

    if (remainingPoints - pointDifference >= 0) {
      setState(() {
        attributes[attribute] = value;
        remainingPoints -= pointDifference;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '开启你的三国人生',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C3E50),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2C3E50),
              Color(0xFF3498DB),
              Color(0xFF2C3E50),
            ],
          ),
        ),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              24.0, 24.0, 24.0, MediaQuery.of(context).padding.bottom + 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: '姓名',
                  labelStyle: const TextStyle(color: Colors.white70),
                  hintText: '输入你的名字',
                  hintStyle: const TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white54),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '剩余点数: $remainingPoints',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _randomizeAttributes,
                    icon: const Icon(Icons.casino),
                    label: const Text('随机分配'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF2C3E50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ...attributes.entries.map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: AttributeSlider(
                      attributeName: entry.key,
                      value: entry.value,
                      onChanged: (value) => _updateAttribute(entry.key, value),
                      maxValue: 10,
                    ),
                  )),
              const SizedBox(height: 24),
              const Text(
                '选择出身背景',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedBackground,
                dropdownColor: const Color(0xFF2C3E50),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white54),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white54),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                items: backgrounds
                    .map((background) => DropdownMenuItem(
                          value: background['name'],
                          child: Text(
                            '${background['name']} - ${background['description']}',
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBackground = value!;
                  });
                },
                isExpanded: true,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: remainingPoints == 0
                      ? () {
                          if (_nameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('请输入姓名')),
                            );
                            return;
                          }

                          final character = Character(
                            name: _nameController.text,
                            military: attributes['武力']!,
                            intelligence: attributes['智谋']!,
                            leadership: attributes['统帅']!,
                            politics: attributes['政治']!,
                            background: selectedBackground,
                          );

                          context.read<GameProvider>().initializeCharacter(
                                character,
                                184,
                                15,
                              );

                          Navigator.pushReplacementNamed(context, '/game');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        remainingPoints == 0 ? Colors.white : Colors.grey[300],
                    foregroundColor: const Color(0xFF2C3E50),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    '开始人生',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
