import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final TextEditingController _textController = TextEditingController();
  double _qrSize = 200;
  Color _qrColor = Colors.black;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _saveQrCode() async {
    if (_textController.text.isEmpty) return;

    final status = await Permission.storage.request();
    if (!status.isGranted) return;

    try {
      final qrPainter = QrPainter(
        data: _textController.text,
        version: QrVersions.auto,
        color: Colors.black,
      );

      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/qr_code.png';
      final file = File(path);

      final qrImage = await qrPainter.toImageData(300);
      await file.writeAsBytes(qrImage!.buffer.asUint8List());

      final result = await ImageGallerySaver.saveFile(path);
      if (result['isSuccess']) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('QR Code saved to gallery')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save QR Code')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                ],
              ),
            ),
          ),
          SafeArea(
            child: _buildGenerateTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Input card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter text or URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.text_fields),
                ),
                onChanged: (value) => setState(() {}),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Size slider
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('QR Code Size'),
                  Slider(
                    value: _qrSize,
                    min: 100,
                    max: 300,
                    divisions: 20,
                    label: _qrSize.round().toString(),
                    onChanged: (value) => setState(() => _qrSize = value),
                  ),
                ],
              ),
            ),
          ),

          // Color picker
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('QR Code Color'),
                  DropdownButton<Color>(
                    value: _qrColor,
                    items: [
                      Colors.black,
                      Colors.blue,
                      Colors.red,
                      Colors.green,
                      Colors.purple,
                    ]
                        .map((color) => DropdownMenuItem(
                              value: color,
                              child: Container(
                                width: 24,
                                height: 24,
                                color: color,
                              ),
                            ))
                        .toList(),
                    onChanged: (color) {
                      if (color != null) {
                        setState(() => _qrColor = color);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // QR Code display
          if (_textController.text.isNotEmpty)
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    QrImageView(
                      data: _textController.text,
                      version: QrVersions.auto,
                      size: _qrSize,
                      backgroundColor: Colors.white,
                      foregroundColor: _qrColor,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _saveQrCode,
                          icon: const Icon(Icons.save),
                          label: const Text('Save'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Share.share(_textController.text);
                          },
                          icon: const Icon(Icons.share),
                          label: const Text('Share'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
