void main() {
//  split();
  String str = "ASFASFWname=tianlin&age=23?";
  List<String> query = str.split(RegExp(r'\?'));
  print(query);
  print(''.isEmpty);

  print(getQueryVariable(query[1]).toString());
}

getQueryVariable(query) {
  var vars = query.split("&");
  Map map = {};
  for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split("=");
    map[pair[0]] = pair[1];
  }

  return map;
}

split() {
  String str = '.12';
  print(str.split(RegExp(r'\.'))[1].length);
}

replaceAll() {
  String str = 'iii00012iii';

  print(str.replaceFirst(RegExp('0*'), ''));

  print(str.replaceAll(RegExp('i\+'), ''));
  print(str.replaceAll(RegExp('^i*'), ''));
  print(str.replaceAll(RegExp('i*\$'), ''));
}
