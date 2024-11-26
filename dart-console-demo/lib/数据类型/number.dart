void main() {
  String str = '.1';
  String str2 = '1.';

  print(double.parse(str));
  print(double.parse(str2));
//  print(int.parse(str2));   // exception
  print(num.parse(str2));
}

emptyStr() {
  String str1 = '';

//  print(double.parse(str1));
  print(num.parse(str1));
}
