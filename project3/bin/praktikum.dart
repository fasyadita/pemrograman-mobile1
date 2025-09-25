import 'dart:io';

void main(List<String> arguments) {

// Daftar nama mahasiswa dan jumlahnya
  print("");
  stdout.writeln("Daftar nama mahasiswa dan jumlahnya");
  var nama = ["fasya","dita","annisa","sinta","della"];
  nama.add("dea");
  nama.remove("annisa");

  stdout.writeln(nama);
  stdout.writeln('Jumlah data: ${nama.length}');
  print("");

// union dan intersection dari sebuah data yang diinput manual
  print("union dan intersection dari sebuah data yang diinput manual");
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
  print("");

  // menggunakan map untuk menyimpan data barang 
  print("menggunakan map untuk menyimpan data barang ");
    var barang = {
    'kode' : ['101','102', "103"],
    'Nama' : ['Susu','ice cream', 'coco crunch'],
    'harga' : [20000 , 5000 , 10000],
  };

  stdout.write("berapa jumlah barang yang ingin ditambahkan = ");
  String? jumlah = stdin.readLineSync();
  int total = (int.tryParse(jumlah ?? '')) ?? 0;

  for (var i = 0; i < total; i++) {
    stdout.write("masukkan kode barang ke-$i= ");
    String? kode = stdin.readLineSync();
    String kode1 =  kode ?? '';
    barang['kode']?.add(kode1);
    stdout.write("masukkan nama barang ke-$i= ");
    String? nama = stdin.readLineSync();
    String nama1 =  nama ?? '';
    barang['nama']?.add(nama1);
    stdout.write("masukkan harga barang ke-$i= ");
    String? harga = stdin.readLineSync();
    int harga1 = (int.tryParse(harga ?? '')) ?? 0;
    barang['harga']?.add(harga1);
  }

  print(barang);
  print("");

  // fungsi closure untuk diskon bertingkat
  print("fungsi closure untuk diskon bertingkat");
  int hargaAwal = 100000;

  var diskon5  = buatDiskon(0.05); // 5%
  var diskon10 = buatDiskon(0.10); // 10%
  var diskon15 = buatDiskon(0.15); // 15%

  print("Diskon 5%  -> Harga setelah diskon: ${diskon5(hargaAwal)}");
  print("Diskon 10% -> Harga setelah diskon: ${diskon10(hargaAwal)}");
  print("Diskon 15% -> Harga setelah diskon: ${diskon15(hargaAwal)}");

}

// fungsi closure diskon
Function buatDiskon(double persen) {
  return (int harga) => harga - (harga * persen).toInt();
}