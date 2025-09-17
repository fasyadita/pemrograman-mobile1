import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  print('Hello world: ${project2.calculate()}!');

  // print('coba');
  print("masukkan angka hari");
  String? hari=stdin.readLineSync();
  int nilai =int.tryParse(hari ?? '') ?? 0;

  switch (nilai) {
    case 1:
      print("Senin");
      break;
    case 2 :
      print("Selasa");
      break;
    case 3 :
      print("Rabu");
    default:
      print("Maaf inputan tidak valid");
  }
}