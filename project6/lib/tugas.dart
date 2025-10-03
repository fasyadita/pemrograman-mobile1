import 'package:flutter/material.dart';

void main() {
  runApp(FasyaApp());
}

class FasyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Profile & Counter Apps",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil Mahasiswa",
              style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Arial',
            ),
          ),
          backgroundColor: Colors.lightBlue,
          
        ),
      ),
    );
  }


}
