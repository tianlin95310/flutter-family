void main() async {
  print(await fun1());
  print(fun2());
  print(await fun2());
  print(fun3());
}

fun1() async {
  await Future.delayed(Duration(seconds: 3));
  return 'fun1';
}

fun2() async {
  await Future.delayed(Duration(seconds: 2));
  return 'fun1';
}

fun3() {
  return 'fun3';
}

