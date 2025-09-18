import 'dart:io';

void main(List<String> args) {
  print("MAP NILAI UJIAN SISWA");
  print("dengan keterangan : ");
  print("A    : Nilai >= 80 ");
  print("B    : Nilai 60-79 ");
  print("C    : Nilai < 60 ");

  for (int i = 1; i <= 5; i++) {
  print("Masukkan Nilai Mahasiswa ke-$i : ");
    String? nilai = stdin.readLineSync();
    int j = int.tryParse(nilai ?? '') ?? 0 ;

    if (j >= 80) {
      print("Nilai A");
    } else if (60 < j && j < 79){
      print("Nilai B");
    } else{
      print("Nilai C");
    }
  }
}