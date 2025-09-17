import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  print('Hello world: ${project2.calculate()}!');
  
  // int nilai = 75;
  stdout.write("Masukkan nilai = ");
  // String? input = stdin.readLineSync();
  // int nilai = int.tryParse(input ?? '') ?? 0;

  //int nilai = int.tryParse(input?? '') ?? 0;
  // String tmp = input ?? '';
  // int nilai =int.tryParse(tmp) ?? 0;

  // String tmp;
  // if (input == null) {
  //   tmp = '';
  // } else {
  //   tmp = input;
  // }

  // int nilai =int.tryParse(tmp) ?? 0;

  String? input = stdin.readLineSync();
  dynamic nilai = int.tryParse(input ?? '');
  if ((nilai >= 75) && (nilai <= 100)){
    print("Nilai A");
  } else if ((nilai >= 60) && (nilai <= 74)){
    print("Nilai B");
  } else if ((nilai >= 0) && (nilai <= 59)) {
    print("Nilai adalah C");
  } else {
    print("Maaf, Nilai tidak benar");
  }

  // if tradisional 
  String status;
  if(nilai>=60) {
    status="Lulus";
  } else {
    status="Tidak Lulus";
  }
  print(status);

  // ternary operator
  String status1=(nilai>=60)
    ? "alhamdulillah Lulus"
    : "maaf tidak Lulus";

  print(status1);

}
