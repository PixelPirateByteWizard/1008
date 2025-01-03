import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextToSpeechPage extends StatefulWidget {
  const TextToSpeechPage({super.key});

  @override
  State<TextToSpeechPage> createState() => _TextToSpeechPageState();
}

class _TextToSpeechPageState extends State<TextToSpeechPage> {
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textController = TextEditingController();
  double _speechRate = 0.5;
  double _volume = 1.0;
  double _pitch = 1.0;
  String _selectedLanguage = 'en-US';
  bool _isSpeaking = false;
  List<String> _languages = ['en-US'];
  String _currentText = '';

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage(_selectedLanguage);
    await _flutterTts.setSpeechRate(_speechRate);
    await _flutterTts.setVolume(_volume);
    await _flutterTts.setPitch(_pitch);

    // Get available languages
    final languages = await _flutterTts.getLanguages;
    setState(() {
      _languages = languages
          .cast<String>()
          .where((lang) =>
              lang.contains('en') ||
              lang.contains('es') ||
              lang.contains('fr') ||
              lang.contains('de') ||
              lang.contains('it'))
          .toList();
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
    });
  }

  Future<void> _speak() async {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _isSpeaking = true;
        _currentText = _textController.text;
      });
      await _flutterTts.speak(_textController.text);
    }
  }

  Future<void> _stop() async {
    setState(() {
      _isSpeaking = false;
    });
    await _flutterTts.stop();
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.1),
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with animation
                      SizedBox(
                        height: 60,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                              'Text to Speech',
                              textStyle: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Text input card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            controller: _textController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Enter text to convert to speech...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Controls card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Language selector
                              DropdownButtonFormField<String>(
                                value: _selectedLanguage,
                                decoration: InputDecoration(
                                  labelText: 'Language',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                items: _languages.map((String language) {
                                  return DropdownMenuItem(
                                    value: language,
                                    child: Text(language),
                                  );
                                }).toList(),
                                onChanged: (String? value) async {
                                  if (value != null) {
                                    setState(() => _selectedLanguage = value);
                                    await _flutterTts.setLanguage(value);
                                  }
                                },
                              ),
                              const SizedBox(height: 16),

                              // Speech rate slider
                              const Text('Speech Rate'),
                              Slider(
                                value: _speechRate,
                                min: 0.0,
                                max: 1.0,
                                divisions: 10,
                                label: _speechRate.toString(),
                                onChanged: (value) async {
                                  setState(() => _speechRate = value);
                                  await _flutterTts.setSpeechRate(value);
                                },
                              ),

                              // Pitch slider
                              const Text('Pitch'),
                              Slider(
                                value: _pitch,
                                min: 0.5,
                                max: 2.0,
                                divisions: 15,
                                label: _pitch.toString(),
                                onChanged: (value) async {
                                  setState(() => _pitch = value);
                                  await _flutterTts.setPitch(value);
                                },
                              ),

                              // Volume slider
                              const Text('Volume'),
                              Slider(
                                value: _volume,
                                min: 0.0,
                                max: 1.0,
                                divisions: 10,
                                label: _volume.toString(),
                                onChanged: (value) async {
                                  setState(() => _volume = value);
                                  await _flutterTts.setVolume(value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Floating action button with animation
      floatingActionButton: AnimatedScale(
        scale: _isSpeaking ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton.extended(
          onPressed: _isSpeaking ? _stop : _speak,
          icon: Icon(_isSpeaking ? Icons.stop : Icons.play_arrow),
          label: Text(_isSpeaking ? 'Stop' : 'Speak'),
          backgroundColor:
              _isSpeaking ? Colors.red : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
