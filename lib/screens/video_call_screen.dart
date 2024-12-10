import 'dart:async';
import 'package:flutter/material.dart';
import '../models/ai_character.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class VideoCallScreen extends StatefulWidget {
  final AICharacter character;

  const VideoCallScreen({
    super.key,
    required this.character,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen>
    with SingleTickerProviderStateMixin {
  bool _isConnecting = true;
  bool _isCameraOn = true;
  bool _isUsingFrontCamera = true;
  late Timer _autoExitTimer;
  CameraController? _cameraController;
  late AnimationController _dotAnimationController;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _setupDotAnimation();

    // Auto exit after 30 seconds
    _autoExitTimer = Timer(const Duration(seconds: 30), () {
      Navigator.of(context).pop();
    });
  }

  void _setupDotAnimation() {
    _dotAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      await _cameraController?.dispose();

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.bgra8888,
      );

      await _cameraController?.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Camera initialization error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to initialize camera: $e')),
        );
      }
    }
  }

  Future<void> _toggleCamera() async {
    if (_cameraController == null) return;

    try {
      final cameras = await availableCameras();
      final newLensDirection = _isUsingFrontCamera
          ? CameraLensDirection.back
          : CameraLensDirection.front;

      final newCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == newLensDirection,
        orElse: () => cameras.first,
      );

      await _cameraController?.dispose();

      _cameraController = CameraController(
        newCamera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.bgra8888, // Add this for iOS
      );

      await _cameraController?.initialize();
      if (mounted) {
        setState(() {
          _isUsingFrontCamera = !_isUsingFrontCamera;
        });
      }
    } catch (e) {
      debugPrint('Camera toggle error: $e');
    }
  }

  @override
  void dispose() {
    _autoExitTimer.cancel();
    _dotAnimationController.dispose();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main video view (character)
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.character.avatar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Small video preview (user camera)
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _isCameraOn &&
                        _cameraController?.value.isInitialized == true
                    ? CameraPreview(_cameraController!)
                    : const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white54,
                      ),
              ),
            ),
          ),

          // Connection status
          if (_isConnecting)
            Container(
              color: Colors.black54,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    AnimatedBuilder(
                      animation: _dotAnimationController,
                      builder: (context, child) {
                        return Text(
                          'Connecting with ${widget.character.name}${'.' * ((_dotAnimationController.value * 3).floor() + 1)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

          // Control buttons
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  _isCameraOn ? Icons.videocam : Icons.videocam_off,
                  Colors.white,
                  () => setState(() {
                    _isCameraOn = !_isCameraOn;
                    if (_isCameraOn) {
                      _initializeCamera();
                    } else {
                      _cameraController?.dispose();
                      _cameraController = null;
                    }
                  }),
                ),
                _buildControlButton(
                  Icons.call_end,
                  Colors.red,
                  () => Navigator.of(context).pop(),
                  size: 70,
                ),
                _buildControlButton(
                  Icons.flip_camera_ios,
                  Colors.white,
                  _toggleCamera,
                ),
              ],
            ),
          ),

          // Timer
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '00:00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    IconData icon,
    Color color,
    VoidCallback onPressed, {
    double size = 60,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.2),
        border: Border.all(color: color, width: 2),
      ),
      width: size,
      height: size,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onPressed,
          child: Icon(
            icon,
            color: color,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}
