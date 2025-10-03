import 'package:flutter/material.dart';

void main() {
  runApp(FasyaApp());
}

class FasyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fasya App",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "LYRICS",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Arial',
            ),
          ),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          foregroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Everything You Are - Hindia 🎶",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),

                // Bait 1
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Wajahmu ku ingat selalu lupakan\n"
                    "Hal-hal yang menggangguku\n"
                    "Karena hari ini mata kita beradu\n"
                    "Kita saling bantu melepas perasaan",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                SizedBox(height: 16),

                // Bait 2
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Tinggi ke angkasa menantang dunia\n"
                    "Merayakan muda tuk satu jam saja\n"
                    "Kita hampir mati dan kau selamatkan aku\n"
                    "Dan ku menyelamatkanmu dan sekarang aku tahu",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                SizedBox(height: 16),

                // Bait 3
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Cerita kita tak jauh berbeda\n"
                    "Got beat down by the world sometimes I wanna fold\n"
                    "Namun suratmu kan ku ceritakan ke anak-anakku nanti\n"
                    "Bahwa aku pernah dicintai with everything u are\n"
                    "Fully as I am with everything u are",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Wajahmu yang beragam rupa pastikan\n"
                    "Ku tak sendirian\n"
                    "Jalani derita kau bawakan kisahmu\n"
                    "Aku mendengarkan oh kita bergantian\n",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

