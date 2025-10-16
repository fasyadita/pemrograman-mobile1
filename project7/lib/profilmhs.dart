import 'package:flutter/material.dart';

void main() {
  runApp(FasyaApp());
}

class FasyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fasya Profile App",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ProfilPage(),
      },
    );
  }
}

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 AppBar dengan border bawah
      appBar: AppBar(
        title: const Text(
          "Profile Mahasiswa",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 72, 97),
        elevation: 0, // hapus bayangan default
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            color: Colors.tealAccent,
            height: 4, // tinggi garis bawah
          ),
        ),
      ),

      // 🔹 Body dengan border di profil
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.teal,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              const SizedBox(height: 12),
              const Text(
                "Fasya Dita",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text("NIM: 2341760077"),
              const Text("Prodi: SIBI"),
              const Text("Politeknik Negeri Malang"),
            ],
          ),
        ),
      ),
    );
  }
}
