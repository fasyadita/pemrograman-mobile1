import 'dart:io';

void main(List<String> args) {
  print("MAP NILAI UJIAN SISWA");
  print("dengan keterangan : ");
  print("A    : Nilai >= 80 ");
  print("B    : Nilai 60-79 ");
  print("C    : Nilai < 60 ");


  Map<String, String> data = {};

  for (int i = 1; i <= 5; i++) {

    print("Masukkan Nama Mahasiswa ke-$i : ");
    String? nama = stdin.readLineSync();

    print("Masukkan Nilai Mahasiswa ke-$i : ");
    int? nilai = int.tryParse(stdin.readLineSync() ?? "");

    String hasil = "C" ;
    if (nilai != null) {
      if (nilai >= 80) {
        hasil = "A";
      } else if (nilai >= 60 && nilai <= 79){
        hasil = "B";
      } else{
        hasil = "C";
      }
    }
    
      if (nama != null ) {
        // Masukkan ke Map
        data[nama] = hasil;
      }
  }

  print("Isi Map: $data");

}

  // for (int i = 1; i <= 5; i++) {
  // print("Masukkan Nilai Mahasiswa ke-$i : ");
  //   String? nilai = stdin.readLineSync();
  //   int j = int.tryParse(nilai ?? '') ?? 0 ;

  //   if (j >= 80) {
  //     print("Nilai A");
  //   } else if (60 < j && j < 79){
  //     print("Nilai B");
  //   } else{
  //     print("Nilai C");
  //   }
  // }