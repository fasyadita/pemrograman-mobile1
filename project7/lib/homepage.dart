import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda Mahasiswa"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: const Icon(Icons.person),
          label: const Text("Lihat Profil Mahasiswa"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.blueGrey,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
    );
  }
}
