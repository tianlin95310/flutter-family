import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_lib_common/main.dart';

mixin AutoDispose on ConsumerState {
  late final List<StreamSubscription> _stream = [];
  late final List<CancelToken> _cancelToken = [];
  late final List<Completer> _aborts = [];

  final List<ChangeNotifier> _notifiers = [];

  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
  }

  void disposeAll() {
    for (var item in _stream) {
      item.cancel();
    }
    for (var item in _cancelToken) {
      item.cancel();
    }
    for (var item in _aborts) {
      item.complete();
    }
    for (var item in _notifiers) {
      item.dispose();
    }
    for (var item in _timers) {
      item.cancel();
    }
  }

  @override
  void dispose() {
    disposeAll();
    super.dispose();
  }

  void addListener(Object? obj) {
    if (obj is StreamSubscription) {
      _stream.add(obj);
    } else if (obj is CancelToken) {
      _cancelToken.add(obj);
    } else if (obj is Completer) {
      _aborts.add(obj);
    } else if (obj is ChangeNotifier) {
      _notifiers.add(obj);
    } else if (obj is Timer) {
      _timers.add(obj);
    } else if (obj is List) {
      for (var item in obj) {
        addListener(item);
      }
    }
  }

}