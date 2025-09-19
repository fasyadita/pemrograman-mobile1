import 'dart:io';

import 'package:project3/project3.dart' as project3;

void main(List<String> arguments) {
  // print('Hello world: ${project3.calculate()}!');
  
  // var fixedList = List<int>.filled(4,0);

  // fixedList[0] = 1;
  // fixedList[1] = 2;
  // fixedList[2] = 3;
  // fixedList[3] = 4;
  // // fixedList[4] = 4;

  // stdout.writeln(fixedList);

  // var growList = [1,2,3];
  // growList.add(7);
  // growList.remove(3);

  // stdout.writeln(growList);

  var setNilai1 =<String>{};
  var setNilai2 =<int>{1,2,3};

  // print(setNilai2);
  // print(setNilai1.union(setNilai2));
  // print(setNilai2.intersection(setNilai1)); //irisan

  stdout.writeln("Jumlah data setNilai1 = ");
  String? input1 = stdin.readLineSync();
  int jumlah1 = (int.tryParse(input1 ?? '')) ?? 0;
  for (var i = 0; i < jumlah1; i++) {
    stdout.writeln("Masukkan Nilai Ke-${i+1} = ");
    String? inputNilai = stdin.readLineSync();
    String nilai = inputNilai ?? '';
    setNilai1.add(nilai);
  }

  // mengubah dari set menjadi list
  var nilaiList = setNilai1.toList();
  print(nilaiList.elementAt(1)); //jika ingin di print sesuai index
  print(nilaiList[1]);

  // print(setNilai1);



}
