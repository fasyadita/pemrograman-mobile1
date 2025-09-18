import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  print("masukkan nilai awal : ");
  String? nilai = stdin.readLineSync();
  int i = int.tryParse(nilai ?? '') ?? 0 ;
  while (i <= 10) {
    print("iterasi ke $i");
    i++;
  }

  int a = int.tryParse(nilai ?? '') ?? 0;
  do {
    print("perulangan ke $a");
    a++;
  } while (a <= 10);

}