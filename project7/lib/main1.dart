import 'package:flutter/material.dart';
import 'appRoutes.dart';

void main() {
  runApp(const MahasiswaApp());
}

class MahasiswaApp extends StatelessWidget {
  const MahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: appRoutes, // dari routes.dart
    );
  }
}