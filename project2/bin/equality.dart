import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  int a = 10;
  int b = 10;;
  print(a==b);
  print(identical(a,b));
  String s1 = "dart";
  String s2 = "Dart";
  print(s1 == s2);
}