import 'package:flutter/material.dart';

void main() {
  runApp(FasyaApp());
}

class FasyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fasya Profile & Counter Apps",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil Mahasiswa Cantik",
              style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Arial',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 12, 114, 114),
        ),

        body: Container(
          color: const Color.fromARGB(255, 161, 219, 241),
          width: double.infinity, // biar full selebar layar
          height: double.infinity, // biar full setinggi layar
          child : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40), 
              const FlutterLogo(size: 80),
              const SizedBox(height: 20),


            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //foto profil
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.blueAccent, width: 3),
                      image: DecorationImage(
                        image : AssetImage("assets/image/paca.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20, width: 30,),

                  Text(
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

                  const SizedBox( height: 40),
                ],
              ),
            ),
            
            //Placeholder(fallbackHeight: 100, fallbackWidth: 100),

              const SizedBox(height: 20),
                  // email
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "fasyadita1@gmail.com",
                        style: TextStyle(fontSize: 16, fontFamily: 'Oswald'),
                      ),
                    ],
                  ),

                  SizedBox(height: 10, width: 80),

                  //row teleppon
                  const Row(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children : [
                      Icon(Icons.phone, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "+62 812 3456 7890",
                        style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                      ),
                    ],
                  ),

                
            

            ],
          ),
        ),
         

      ),
    );
  }


}
