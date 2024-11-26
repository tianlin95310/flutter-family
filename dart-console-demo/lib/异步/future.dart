void main() async {
  microtask();
}
microtask() {
  Future.microtask(() async {
    return Future.value(123);
  }).then((value) => print(value));
}
futureType() async {
  print((await fun3()).runtimeType);
  print((fun4()).runtimeType);
}
wait() {
  Future.wait([fun1(), fun2()]).then((res) {
    print(res);
  });
}
Future<dynamic> fun1() async {
  Future.delayed(Duration(seconds: 1), () {
    print('fun1');
  });
  return '111111';
}

Future<String> fun2() async {
  Future.delayed(Duration(milliseconds: 2), () {
    print('fun2');
  });
  return '222222';
}

Future<dynamic> fun3() async {
  Future.delayed(Duration(milliseconds: 3), () {
    print('fun3');
  });
  return await fun2();
}

Future<String> fun4() async {
  Future.delayed(Duration(milliseconds: 2), () {
    print('fun4');
  });
  return fun2();
}
