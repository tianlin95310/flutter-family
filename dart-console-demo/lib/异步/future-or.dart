import 'dart:async';

void main() {
  print(fun());
  print(funA());
  print(funB());
  print(funC());
}
// FutureOr含义是返回值可以使Future也可以不是
FutureOr<String?> fun(){
  return null;
}
FutureOr<String?> funA() async{
  return null;
}
FutureOr<String?> funB() async{
  return 'hello';
}
FutureOr<String?> funC(){
  return 'hello';
}

