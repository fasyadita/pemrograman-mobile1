import 'dart:io';

void main(List<String> arguments) {

  var nama = ["fasya","dita","annisa","sinta","della"];
  nama.add("dea");
  nama.remove("annisa");

  stdout.writeln(nama);
  stdout.writeln('Jumlah data: ${nama.length}');

}