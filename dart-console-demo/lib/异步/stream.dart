import 'dart:async';

void main() {
  // periodicStream();
  // futureStream();
  // iterableStream();
  listenStream();
  broadcastStream();
  // streamTransformer();
}

streamTransformer() {
  Stream<int> stream =
      Stream<int>.periodic(Duration(seconds: 1), (e) => e).asBroadcastStream();
  stream = stream.take(5);

  StreamTransformer<int, String> streamTransformer =
      StreamTransformer<int, String>.fromHandlers(
          handleData: (int value, EventSink sink) {
    print(value);
    sink.add('name${value}');
  }, handleDone: (EventSink sink) {
    print(sink);
    sink.close();
  }, handleError: (error, StackTrace stackTrace, EventSink sink) {
    print(error);
    sink.addError('wrong: $error');
    print(stackTrace);
    print(sink);
  });
  stream.transform(streamTransformer).listen(print);
}

broadcastStream() {
  // 多方监听
  Stream<int> stream =
      Stream<int>.periodic(Duration(seconds: 1), (e) => e).asBroadcastStream();
  stream = stream.take(5);
  stream.listen(print);
  stream.listen(print);
}

// 同时调用会报错
listenStream() {
  List<int> list = [1, 2, 3, 4];
  Stream<int> stream = Stream<int>.fromIterable(list);
  // stream = stream.take(3);
  stream.listen((int x) {
    print(x);
  });
  // 同时
  stream.listen((int x){
    print(x);
  });
}

iterableStream() {
  List<int> list = [1, 2, 3, 4];
  Stream<int> stream = Stream<int>.fromIterable(list);
  stream.forEach((int x) {
    print(x);
  });
}

futureStream() async {
  Future future = Future.delayed(Duration(seconds: 2), () {
    return 'futureStream';
  });
  Stream stream = Stream.fromFuture(future);
  await for (dynamic v in stream) {
    print(v);
  }
}

periodicStream() async {
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), (value) {
    print(value);
    return value;
  });
  await for (int v in stream) {
    print(v);
  }
}
