import 'dart:async';

void main() {
  Stream<int> a = funa();
  a.asBroadcastStream(onListen: (StreamSubscription<int> subscription){
    print(subscription);
  }).listen((event) {
    print('a listen $event');
  });
  print(a.forEach(print));
  // print(funb()..forEach(print));

  // Future<int> c = func();
  // print(c..then(print));
  // print(fund()..forEach(print));
}

// 返回同步流
Stream<int> funa() async* {
  yield await 1;
  yield* Stream<int>.fromIterable([2 ,3]);
  yield 4;
}

/// unsupported sync
// Iterable<List> fune() sync {
//   yield [];
// }

//返回迭代类
Iterable<int> funb() sync* {
  List<int> data1 = [1, 2, 3];
  yield* [4, 5];
  yield* data1.skip(2);
  yield 6;
}

//返回异步Future
Future<int> func() async {
  return 333;
}
//返回迭代类
Iterable<List> fund() sync* {
  yield [1];
  yield* [[2], [3]];
}


