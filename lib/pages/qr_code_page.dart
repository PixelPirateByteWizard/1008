import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'dart:typed_data'; // Add this import

final qrDataProvider = StateProvider<String>((ref) => '');

class QRCodePage extends ConsumerWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrData = ref.watch(qrDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter text or URL',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) => ref.read(qrDataProvider.notifier).state = value,
            ),
            const SizedBox(height: 20),
            if (qrData.isNotEmpty) ...[
              Center(
                child: QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _saveQrCode(context, ref),
                icon: const Icon(Icons.save),
                label: const Text('Save QR Code'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ] else
              const Center(
                child: Text(
                  'Enter text or URL to generate QR code',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveQrCode(BuildContext context, WidgetRef ref) async {
    final qrData = ref.read(qrDataProvider);
    final qrPainter = QrPainter(
      data: qrData,
      version: QrVersions.auto,
      color: Colors.black,
      emptyColor: Colors.white,
    );

    final painter = qrPainter;
    final picSize = 300.0;
    final ui.Image image = await painter.toImage(picSize);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData?.buffer.asUint8List() ?? Uint8List(0);

    final PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(pngBytes, quality: 100);
      if (result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('QR Code saved to gallery')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save QR Code')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied')),
      );
    }
  }
}