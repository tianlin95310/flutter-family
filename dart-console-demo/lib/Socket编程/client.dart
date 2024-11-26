import 'dart:convert';
import 'dart:io';

void main() {
  Socket.connect('127.0.0.1', 10005).then((socket) async {
    // socket.transform(UTF8.decoder).listen(print);
    socket.write('{"cmd":"current time"');
    await Future.delayed(const Duration(seconds: 1));
    socket.write(',"params":{"region":"北京"}}');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('{"cmd":"current time"');
    await Future.delayed(const Duration(seconds: 1));
    socket.write(',"params":{"region":"伦敦"}}{"cmd":"XX"}');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('{}}{');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('"cmd":"天气"}');
  });
}
