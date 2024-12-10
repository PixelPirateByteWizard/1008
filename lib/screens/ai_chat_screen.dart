import 'package:flutter/material.dart';
import 'ai_conversation_screen.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'How to authenticate jewelry pieces?',
      'icon': Icons.verified_outlined,
      'category': 'Authentication'
    },
    {
      'question': 'Professional jewelry care guide',
      'icon': Icons.spa_outlined,
      'category': 'Care'
    },
    {
      'question': 'Investment-grade jewelry guide',
      'icon': Icons.diamond_outlined,
      'category': 'Investment'
    },
    {
      'question': 'Styling with fine jewelry',
      'icon': Icons.style_outlined,
      'category': 'Style'
    },
    {
      'question': 'Gemstone quality factors',
      'icon': Icons.analytics_outlined,
      'category': 'Education'
    },
    {
      'question': 'Precious metal properties',
      'icon': Icons.architecture_outlined,
      'category': 'Materials'
    },
    {
      'question': 'Jewelry valuation basics',
      'icon': Icons.assessment_outlined,
      'category': 'Value'
    },
    {
      'question': 'Collector\'s buying guide',
      'icon': Icons.shopping_bag_outlined,
      'category': 'Shopping'
    },
    {
      'question': 'Insurance & documentation',
      'icon': Icons.policy_outlined,
      'category': 'Security'
    },
    {
      'question': 'Authentication certificates',
      'icon': Icons.verified_user_outlined,
      'category': 'Documentation'
    },
    {
      'question': 'How to choose earrings for different face shapes?',
      'icon': Icons.face_outlined,
      'category': 'Style'
    },
    {
      'question': 'Earring materials and their properties',
      'icon': Icons.texture_outlined,
      'category': 'Materials'
    },
    {
      'question': 'Caring for your earrings',
      'icon': Icons.cleaning_services_outlined,
      'category': 'Care'
    },
    {
      'question': 'Earring trends for the season',
      'icon': Icons.trending_up_outlined,
      'category': 'Trends'
    },
    {
      'question': 'History of earrings in fashion',
      'icon': Icons.history_edu_outlined,
      'category': 'History'
    },
    {
      'question': 'Matching earrings with outfits',
      'icon': Icons.style_outlined,
      'category': 'Fashion'
    },
    {
      'question': 'Earring types and their uses',
      'icon': Icons.category_outlined,
      'category': 'Types'
    },
    {
      'question': 'How to store earrings properly',
      'icon': Icons.storage_outlined,
      'category': 'Storage'
    },
    {
      'question': 'Earrings for different occasions',
      'icon': Icons.event_outlined,
      'category': 'Occasions'
    },
    {
      'question': 'DIY earring projects',
      'icon': Icons.build_outlined,
      'category': 'DIY'
    },
  ];

  List<Map<String, dynamic>> filteredQuestions = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filtered questions with all questions
    filteredQuestions = List.from(questions);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterQuestions(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredQuestions = List.from(questions);
      } else {
        filteredQuestions = questions.where((question) {
          final questionText = question['question'].toString().toLowerCase();
          final category = question['category'].toString().toLowerCase();
          final searchLower = query.toLowerCase();

          return questionText.contains(searchLower) ||
              category.contains(searchLower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Updated to match the number of questions
    final List<Color> categoryColors = [
      const Color(0xFFF8F1E9), // 温暖米色
      const Color(0xFFE8EFF1), // 淡青灰
      const Color(0xFFF3E8E8), // 柔粉灰
      const Color(0xFFEFF0E8), // 淡橄榄
      const Color(0xFFE8EAF6), // 淡靛蓝
      const Color(0xFFF1E8F0), // 淡紫灰
      const Color(0xFFE9F1E8), // 淡草绿
      const Color(0xFFF0E8E8), // 淡玫瑰
      const Color(0xFFE8F0F0), // 淡青蓝
      const Color(0xFFF0EBE5), // 淡卡其
      const Color(0xFFF8F1E9), // Repeat colors if needed
      const Color(0xFFE8EFF1),
      const Color(0xFFF3E8E8),
      const Color(0xFFEFF0E8),
      const Color(0xFFE8EAF6),
      const Color(0xFFF1E8F0),
      const Color(0xFFE9F1E8),
      const Color(0xFFF0E8E8),
      const Color(0xFFE8F0F0),
      const Color(0xFFF0EBE5),
    ];

    final List<Color> categoryTextColors = [
      const Color(0xFF8B6B4F), // 深棕
      const Color(0xFF607D8B), // 青灰
      const Color(0xFF896C6C), // 玫瑰褐
      const Color(0xFF7B8148), // 橄榄绿
      const Color(0xFF5C6BC0), // 靛蓝
      const Color(0xFF8E6C8E), // 紫灰
      const Color(0xFF689F38), // 草绿
      const Color(0xFF9E6C6C), // 玫瑰红
      const Color(0xFF558B8B), // 青蓝
      const Color(0xFF8D7355), // 卡其褐
      const Color(0xFF8B6B4F), // Repeat colors if needed
      const Color(0xFF607D8B),
      const Color(0xFF896C6C),
      const Color(0xFF7B8148),
      const Color(0xFF5C6BC0),
      const Color(0xFF8E6C8E),
      const Color(0xFF689F38),
      const Color(0xFF9E6C6C),
      const Color(0xFF558B8B),
      const Color(0xFF8D7355),
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search questions or categories...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF95A5A6),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF95A5A6),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFECF0F1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: _filterQuestions,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Explore AI Questions',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                        height: 1.2,
                      ),
                    ),
                    const Text(
                      'Find answers to your queries',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Discover insights from our AI knowledge base',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF7F8C8D),
                              height: 1.4,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3498DB),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.help_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    'How to Use',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  content: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '1. Browse through the AI questions',
                                        style: TextStyle(
                                            fontSize: 14, height: 1.5),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '2. Use the search bar to find specific topics',
                                        style: TextStyle(
                                            fontSize: 14, height: 1.5),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '3. Tap on any card to view detailed information',
                                        style: TextStyle(
                                            fontSize: 14, height: 1.5),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Got it',
                                        style: TextStyle(
                                          color: Color(0xFF3498DB),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: filteredQuestions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AIConversationScreen(
                                initialQuestion: filteredQuestions[index]
                                    ['question']!,
                                questionIcon: filteredQuestions[index]['icon'],
                                category: filteredQuestions[index]['category']!,
                                categoryColor: categoryColors[index],
                                categoryTextColor: categoryTextColors[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                filteredQuestions[index]['icon'],
                                size: 32,
                                color: categoryTextColors[index],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 3),
                                decoration: BoxDecoration(
                                  color: categoryColors[index],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  filteredQuestions[index]['category']!,
                                  style: TextStyle(
                                    color: categoryTextColors[index],
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                filteredQuestions[index]['question']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
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
