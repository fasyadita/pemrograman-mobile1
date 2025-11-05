import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'dart:math' as math;
import 'package:image/image.dart' as img;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achapture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 96, 58, 112),
      ),
      home: const CameraPage(),
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraReady = false;
  bool _isRearCamera = true;
  XFile? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      debugPrint("📸 Inisialisasi kamera...");
      cameras = await availableCameras();

      if (cameras == null || cameras!.isEmpty) {
        debugPrint("❌ Tidak ada kamera ditemukan!");
        return;
      }

      // pilih kamera belakang atau depan sesuai state
      final selectedCamera = _isRearCamera
          ? cameras!.firstWhere(
              (cam) => cam.lensDirection == CameraLensDirection.back,
              orElse: () => cameras!.first,
            )
          : cameras!.firstWhere(
              (cam) => cam.lensDirection == CameraLensDirection.front,
              orElse: () => cameras!.first,
            );

      _controller = CameraController(selectedCamera, ResolutionPreset.medium);
      await _controller!.initialize();

      if (!mounted) return;
      setState(() => _isCameraReady = true);

      debugPrint("✅ Kamera aktif: ${selectedCamera.lensDirection}");
    } catch (e) {
      debugPrint("⚠️ Gagal inisialisasi kamera: $e");
      if (mounted) setState(() => _isCameraReady = false);
    }
  }

  Future<void> _switchCamera() async {
    if (cameras == null || cameras!.length < 2) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        const SnackBar(content: Text("⚠️ Hanya ada satu kamera di perangkat ini")),
      );
      return;
    }

    setState(() {
      _isCameraReady = false;
      _isRearCamera = !_isRearCamera;
    });

    await _controller?.dispose();
    await _initCamera();
  }

Future<void> _takePicture() async {
  if (_controller == null || !_controller!.value.isInitialized) return;

  try {
    final image = await _controller!.takePicture();
    File originalFile = File(image.path);
    XFile finalImage = image;

    // Kalau kamera depan → balik hasil supaya nggak mirror
    if (!_isRearCamera) {
      final bytes = await originalFile.readAsBytes();
      img.Image? capturedImage = img.decodeImage(bytes);

      if (capturedImage != null) {
        img.Image flippedImage = img.flipHorizontal(capturedImage);

        final flippedPath = image.path.replaceAll('.jpg', '_flipped.jpg');
        await File(flippedPath).writeAsBytes(img.encodeJpg(flippedImage));
        finalImage = XFile(flippedPath);
      }
    }

    setState(() {
      _capturedImage = finalImage;
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      const SnackBar(content: Text("📸 Gambar berhasil diambil! Klik 'Simpan' untuk menyimpan.")),
    );
  } catch (e) {
    debugPrint('Error taking picture: $e');
  }
}



  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achapture - Take a moment with us'),
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'nosifer',
          color: Color.fromARGB(255, 243, 71, 3),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 5, 4),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 📸 Konten utama
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  const Text(
                    'Welcome to Achapture!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'creepster',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Kamera preview
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: _isCameraReady && _controller != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _controller!.value.previewSize!.height,
                                height: _controller!.value.previewSize!.width,
                                child: CameraPreview(_controller!),
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),

                  const SizedBox(height: 16),

                  // Tombol ambil gambar
                  ElevatedButton.icon(
                    onPressed: _isCameraReady ? _takePicture : null,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Ambil Gambar"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Tombol ganti kamera
                  ElevatedButton.icon(
                    onPressed: _isCameraReady ? _switchCamera : null,
                    icon: const Icon(Icons.cameraswitch),
                    label: Text(_isRearCamera
                        ? "Pakai Kamera Depan"
                        : "Pakai Kamera Belakang"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      backgroundColor: Colors.lightBlueAccent,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Preview hasil foto
                  if (_capturedImage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 250), // 🔹 kasih jarak biar gak ketutup
                    child: Column(
                      children: [
                        const Text(
                          "Hasil Foto:",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 10),

                        // preview hasil foto
                        kIsWeb
                            ? Image.network(
                                _capturedImage!.path,
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.35,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(_capturedImage!.path),
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.35,
                                fit: BoxFit.cover,
                              ),

                        const SizedBox(height: 16),

                        // 🔘 Tombol simpan ke galeri
                        ElevatedButton.icon(
                          onPressed: () async {
                            await GallerySaver.saveImage(_capturedImage!.path, albumName: "Achapture");
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("✅ Foto berhasil disimpan ke galeri!")),
                            );
                          },
                          icon: const Icon(Icons.save_alt),
                          label: const Text("Simpan ke Galeri"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🧩 Dekorasi bawah — diabaikan kliknya biar tombol tetap bisa dipencet
          IgnorePointer(
            ignoring: true,
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/latar.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
          ),

          Positioned(
            top: 10,
            right: 0,
            child: IgnorePointer(
              ignoring: true,
              child: Image.asset(
                'assets/images/laba.png',
                width: 90,
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
