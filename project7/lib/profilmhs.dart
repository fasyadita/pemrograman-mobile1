import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final List<String> mataKuliah = const [
    "Pemrograman Mobile",
    "Manajemen Rantai Pasok",
    "Manajemen Proyek",
    "Kecerdasan Bisnis",
    "Metodologi Penelitian",
    "Penjaminan Mutu Perangkat Lunak",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Mahasiswa"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Profil Mahasiswa
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/image/paca.jpeg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fasya Dita",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("NIM: 2341760077"),
                        Text("Program Studi: Sistem Informasi Bisnis"),
                        Text("Politeknik Negeri Malang"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //Daftar Mata Kuliah
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mata Kuliah Semester 5",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.book, color: Colors.teal),
                      title: Text(mataKuliah[index]),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/gallery');
              },
              icon: const Icon(Icons.photo),
              label: const Text("Lihat Galeri"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

