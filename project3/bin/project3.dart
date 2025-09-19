import 'dart:io';

import 'package:project3/project3.dart' as project3;

void main(List<String> arguments) {
  // print('Hello world: ${project3.calculate()}!');
  
  var fixedList = List<int>.filled(4,0);

  fixedList[0] = 1;
  fixedList[1] = 2;
  fixedList[2] = 3;
  fixedList[3] = 4;
  // fixedList[4] = 4;

  stdout.writeln(fixedList);

  var growList = [1,2,3];
  growList.add(7);
  growList.remove(3);

  stdout.writeln(growList);

}
