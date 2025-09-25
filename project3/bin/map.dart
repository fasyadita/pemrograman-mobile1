import 'dart:io';


void main(List<String> arguments) {
  // map bisa pakai data apa saja
  var sudah = {'NIM' : '2341760077' , 'Nama' : 'Fasya', 'Umur' : '21'}; //bisa menggunakan key yg sama namun akan ketumpuk
  print(sudah);
  print(sudah['Nama']);

  var apa = {
    'Nim' : ['101','102'],
    'Nama' : ['Fasya','dita'],
    'Umur' : [20,21],
  };

  print(apa);
  print(apa['Nama']);
  print(apa['Nama']![1]); //bisa untuk memanggil sesuai dengan indexnya



}