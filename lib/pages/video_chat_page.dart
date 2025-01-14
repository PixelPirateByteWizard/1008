import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../models/companion.dart';

class VideoChatPage extends StatefulWidget {
  final Companion companion;
  final CameraDescription camera;

  const VideoChatPage({
    super.key,
    required this.companion,
    required this.camera,
  });

  @override
  State<VideoChatPage> createState() => _VideoChatPageState();
}

class _VideoChatPageState extends State<VideoChatPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isMuted = false;
  bool _isCameraOff = false;
  bool _isSpeakerOn = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: true,
    );
    _initializeControllerFuture = _controller.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
  }

  void _toggleCamera() {
    setState(() {
      _isCameraOff = !_isCameraOff;
    });
  }

  void _toggleSpeaker() {
    setState(() {
      _isSpeakerOn = !_isSpeakerOn;
    });
  }

  void _endCall() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // 主视频区域（对方视频）- 目前显示等待界面
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(widget.companion.avatarAsset),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      widget.companion.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Waiting for answer...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 本地预览窗口
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _isCameraOff
                      ? Container(
                          color: Colors.grey[900],
                          child: const Center(
                            child: Icon(
                              Icons.videocam_off,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : FutureBuilder<void>(
                          future: _initializeControllerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return CameraPreview(_controller);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        ),
                ),
              ),
            ),

            // 顶部控制栏
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // 底部控制栏
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildControlButton(
                      icon: _isMuted ? Icons.mic_off : Icons.mic,
                      label: _isMuted ? 'Unmute' : 'Mute',
                      onPressed: _toggleMute,
                    ),
                    _buildControlButton(
                      icon: _isCameraOff ? Icons.videocam_off : Icons.videocam,
                      label: _isCameraOff ? 'Camera On' : 'Camera Off',
                      onPressed: _toggleCamera,
                    ),
                    _buildControlButton(
                      icon: _isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                      label: _isSpeakerOn ? 'Speaker' : 'Earpiece',
                      onPressed: _toggleSpeaker,
                    ),
                    _buildControlButton(
                      icon: Icons.call_end,
                      backgroundColor: Colors.red,
                      label: 'End',
                      onPressed: _endCall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor ?? Colors.white.withOpacity(0.2),
          ),
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
