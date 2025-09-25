import 'dart:io';

void main(List<String> arguments) {

// Daftar nama mahasiswa dan jumlahnya
  var nama = ["fasya","dita","annisa","sinta","della"];
  nama.add("dea");
  nama.remove("annisa");

  stdout.writeln(nama);
  stdout.writeln('Jumlah data: ${nama.length}');

// union dan intersection dari sebuah data yang diinput manual
  var setNilai1 =<String>{};
  var setNilai2 =<String>{};

  stdout.write("Berapa Jumlah Angka untuk Nilai 1 = ");
  String? input = stdin.readLineSync();
  int input1 = (int.tryParse(input ?? '')) ?? 0;

  for (var i = 0; i < input1; i++) {
    stdout.write("masukkan nilai ke-$i : ");
    String? nilai1 = stdin.readLineSync();
    String nilai = nilai1 ?? '';
    setNilai1.add(nilai);
  }

  stdout.write("Berapa Jumlah Angka untuk Nilai 2 = ");
  String? input2 = stdin.readLineSync();
  int input3 = (int.tryParse(input2 ?? '')) ?? 0;

  for (var i = 0; i < input3; i++) {
    stdout.write("masukkan nilai ke-$i : ");
    String? nilai2 = stdin.readLineSync();
    String nilai = nilai2 ?? '';
    setNilai2.add(nilai);
  }

  print("Set nilai 1 $setNilai1");
  print("Set nilai 2 $setNilai2");
  
  stdout.write("hasil dari Union nilai 1 dan nilai 2 ");
  print(setNilai1.union(setNilai2));
  stdout.write("hasil dari intersection nilai 2 dan nilai 1 ");
  print(setNilai2.intersection(setNilai1)); //irisan

}