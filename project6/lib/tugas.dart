import 'package:flutter/material.dart';

void main() {
  runApp(FasyaApp());
}

class FasyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // kerangka utama 
      title: "Fasya Profile & Counter Apps",
      debugShowCheckedModeBanner: false, //menghilangkan banner debug
      initialRoute: '/', // halaman awal
      routes: {
        '/': (context) => ProfilPage(), // halaman profil
        '/counter': (context) => CounterPage(), // halaman counter
      },
    );
  }
}

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text( // title pada bar yang atas
          "Profil Mahasiswa Cantik",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Arial',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 114, 114),
        centerTitle: true,
      ),

      body: Container(
        color: const Color(0xFFF5F6FA),
        width: double.infinity, // biar sesuai dengan lebar defaultnya
        height: double.infinity, // biar sesuai dengan tinggi defaultnya
        child: SingleChildScrollView( // biar aman kalau overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // dimulai dari kiri
            children: [
              const SizedBox(height: 40),
              const FlutterLogo(size: 80),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // dimulai dari kiri
                  children: [
                    // Foto profil
                    Container(
                      width: 250, // ukuran lebar foto
                      height: 250, // ukuran tinggi foto
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle, // bentuk bingkainya 
                        border: Border.all(color: Colors.blueAccent, width: 3), // warna bingkainya
                        image: const DecorationImage(
                          image: AssetImage("assets/image/paca.jpeg"), //gambarnya dimasukin bingkainya
                          fit: BoxFit.cover, // gambar akan di sesuaikan dengan bingkainya
                        ),
                      ),
                    ),

                    const SizedBox(width: 30), // jarak lebar antara gambar dengan tulisan

                    // Biodata
                    const Expanded( // untuk mengisi ruang kosong yg tersisa di rownya itu (disebelah fotonya)
                      child: Text(
                        "Fasya Dita Nasahah\n"
                        "2341760077\n"
                        "Sistem Informasi Bisnis",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.yellowAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), //jarak tinggi antar row yang ada 

              // Email
              const Row(
                mainAxisAlignment: MainAxisAlignment.center, // dimulai dr tengah 
                children: [
                  Icon(Icons.email, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text(
                    "fasyadita1@gmail.com",
                    style: TextStyle(fontSize: 16, fontFamily: 'Oswald'),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Telepon
              const Row(
                mainAxisAlignment: MainAxisAlignment.center, // dimulai dari tengah
                children: [
                  Icon(Icons.phone, color: Colors.blueAccent), // icons
                  SizedBox(width: 8),
                  Text(
                    "+62 812 3456 7890",
                    style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Tombol ke halaman counter
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder( //bentuk 
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                label: const Text(
                  "Ke Antrian ", //penamaan tombol
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 40), //mengatur tinggi antar elemen
            ],
          ),
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _tambah() { //fungsi
    setState(() {
      _count++;
    });
  }

  void _kurang() { // fungsi
    setState(() {
      if (_count > 0) _count--;
    });
  }

  void _reset() { // fungsi
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Antrian"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // balik ke profil
        ),
      ),

      body: Container(
        color: const Color.fromARGB(255, 235, 255, 251),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Antrian Sekarang:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

          const SizedBox(height: 20),   // jarak tinggi antar elemen
            
            Text( 
              '$_count', //menghitung sesuai dengan tombol yang di klik
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 20),

            // Tombol tambah & kurang
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // tombol di atur center
              children: [

                ElevatedButton( 
                  onPressed: _kurang, //manggil fungsinya
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    "-", //penamaan tombol  
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),

                const SizedBox(width: 30),

                OutlinedButton(
                  onPressed: _reset, // manggil fungsinya
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  child: const Text(
                    "Reset", //penamaan tombol
                    style: TextStyle(fontSize: 18)),
                ),

                const SizedBox(width: 30),

                ElevatedButton(
                  onPressed: _tambah, // mannggil fungsinya
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    "+", //penamaan tombol
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 40),

            // Tombol balik ke profil
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Kembali ke Profil", // penamaan tombol 
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
