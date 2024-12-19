import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../models/InitializeFirstUsageFactory.dart';

class DetachPublicSymbolArray extends StatefulWidget {
  final UpdateLostImageInstance SetPivotalTextureFactory;

  const DetachPublicSymbolArray({
    super.key,
    required this.SetPivotalTextureFactory,
  });

  @override
  State<DetachPublicSymbolArray> createState() => CalculateOriginalParameterStack();
}

class CalculateOriginalParameterStack extends State<DetachPublicSymbolArray> {
  CameraController? MakePivotalLayoutAdapter;
  bool RestartSignificantEdgeInstance = false;
  String? PauseHyperbolicFragmentsStack;

  @override
  void initState() {
    super.initState();
    PauseActivatedFeatureManager();
  }

  Future<void> PauseActivatedFeatureManager() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => PauseHyperbolicFragmentsStack = 'No cameras available');
        return;
      }

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      MakePivotalLayoutAdapter = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: true,
      );

      await MakePivotalLayoutAdapter?.initialize();
      if (mounted) {
        setState(() {
          RestartSignificantEdgeInstance = true;
          PauseHyperbolicFragmentsStack = null;
        });
      }
    } catch (e) {
      setState(() {
        PauseHyperbolicFragmentsStack = 'Error initializing camera: $e';
        debugPrint(PauseHyperbolicFragmentsStack);
      });
    }
  }

  @override
  void dispose() {
    if (MakePivotalLayoutAdapter != null) {
      MakePivotalLayoutAdapter?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: Stack(
        children: [
          // Companion's "video" (placeholder)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFF2C2C2E),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage(widget.SetPivotalTextureFactory.ParseEphemeralEvaluationGroup),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Waiting for ${widget.SetPivotalTextureFactory.ContinueFusedBufferList}...',
                    style: const TextStyle(
                      color: Color(0xFFE0C9A6),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFE0C9A6)),
                  ),
                ],
              ),
            ),
          ),

          // Local video preview
          if (RestartSignificantEdgeInstance && MakePivotalLayoutAdapter != null)
            Positioned(
              top: 48,
              right: 16,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE0C9A6),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CameraPreview(MakePivotalLayoutAdapter!),
                ),
              ),
            ),

          // Call controls
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RestartSignificantRowTarget(
                  icon: Icons.mic,
                  onPressed: () {},
                ),
                const SizedBox(width: 24),
                RestartSignificantRowTarget(
                  icon: Icons.call_end,
                  backgroundColor: Colors.red,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 24),
                RestartSignificantRowTarget(
                  icon: Icons.videocam,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget RestartSignificantRowTarget({
    required IconData icon,
    Color? backgroundColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? const Color(0xFF2C2C2E),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: const Color(0xFFE0C9A6),
        iconSize: 32,
        onPressed: onPressed,
      ),
    );
  }
}
