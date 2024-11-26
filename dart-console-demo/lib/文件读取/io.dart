import 'dart:io';

void main() {
  fileReader();
}

fileReader() {
  File file = File('C:\\Users\\95310\\Desktop\\小程序.账号.txt');
  print(file.path);
  int index = file.path.lastIndexOf(RegExp(r'\.'));
  print(file.path.substring(index, file.path.length));

  file.readAsString(encoding: SystemEncoding()).then((val) {
    // print(val);
  });

  print(file.absolute);
}
