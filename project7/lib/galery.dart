import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  final List<String> gambar = const [
    "assets/image/page1.jpeg",
    "assets/image/page2.jpeg",
    "assets/image/page3.jpeg",
    "assets/image/page4.jpeg",
    "assets/image/page5.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri Mahasiswa"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dua kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: gambar.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                gambar[index],
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
