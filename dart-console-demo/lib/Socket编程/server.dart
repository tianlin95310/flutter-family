import 'dart:async';
import 'dart:io';

void main() async {
  ServerSocket serverSocket = await ServerSocket.bind('127.0.0.1', 10005);
  StreamSubscription streamSubscription = serverSocket.listen((Socket socket) {
    print('serverSocket listen socket');
    socket.listen((data) {
      print('socket listened');
      print(data);
    }, onError: (error) {
      print('socket listen onError');
      print(error);
    }, onDone: () {
      print('socket listen onDone');
    }, cancelOnError: false);
  }, onError: (error) {
    print('serverSocket listen onError');
    print(error);
  }, onDone: () {
    print('serverSocket listen onDone');
  }, cancelOnError: false);

  print('开始监听');
}
