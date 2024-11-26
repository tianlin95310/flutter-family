import 'dart:io';

void main() {
  String par = 'D:\\work\\Codes\\AS\\arpg\\assets\\images\\char';
  getFileName(par);
}

void getFileName(String path) {
  Directory directory = Directory(path);

  directory.listSync().forEach((element) {
    String name = element.path.replaceAll('\\', '/');
    int index = name.indexOf('assets');
    print('- ' + name.substring(index, name.length) + '/');
  });
}

void addSprite(path) {
  Directory directory = Directory(path);

  List<FileSystemEntity> files = directory.listSync();

  files.forEach((FileSystemEntity element) {
    String name = element.path;
    int index = name.indexOf('images');
    String newName = name
        .substring(index + 'images/'.length, name.length)
        .replaceAll('\\', '/');
    print('skill2item.frames.add(Sprite(\'' + newName + '\'));');
  });
}
