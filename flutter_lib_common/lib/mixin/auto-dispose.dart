import 'dart:async';

import 'package:flutter_lib_common/main.dart';

mixin AutoDispose on ConsumerState {
  late final List<StreamSubscription> _stream = [];
  late final List<CancelToken> _cancelToken = [];
  late final List<Completer> _aborts = [];

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
  }

  @override
  void dispose() {
    disposeAll();
    super.dispose();
  }

  void addListener(Object? stream) {
    if (stream is StreamSubscription) {
      _stream.add(stream);
    } else if (stream is CancelToken) {
      _cancelToken.add(stream);
    } else if (stream is Completer) {
      _aborts.add(stream);
    }
  }

}