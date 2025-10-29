import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'homepage.dart';
// import 'profilmhs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'achapture',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 96, 58, 112),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Achabooth - Take a moment with us'),

          titleTextStyle: const TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.bold,
            fontFamily: 'doodle',
            color: Color.fromARGB(255, 243, 71, 3),
          ),

          backgroundColor: const Color.fromARGB(255, 5, 5, 4),
        ),

        body: const cameraPage(),
      ),
    );
  }
}

class cameraPage extends StatefulWidget {
  const cameraPage({super.key});
  @override
  State<cameraPage> createState() => _cameraPageState();
}

class _cameraPageState extends State<cameraPage> { 
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraReady = false;

  @override
  void initState() {    
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    final firstCamera = cameras!.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await _controller!.initialize();
    setState(() {
      _isCameraReady = true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Welcome to Achapture!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontFamily: 'creepster',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // 🔸 Preview kamera (set tinggi biar gak full)
          Container(
            width: 400,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: _isCameraReady
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CameraPreview(_controller!),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );     
  }
}
