import 'dart:async';

int time = 6;

void main() {
  startCountdownTimer();

  Timer.run(() { print('run');});
}

void startCountdownTimer() {
  const oneSec = Duration(seconds: 1);

  var _timer;

  var callback = (timer) {
    if (time < 1) {
      _timer.cancel();
    } else {
      time = time - 1;
      print(time);
    }
  };

  _timer = Timer.periodic(oneSec, callback);
}
