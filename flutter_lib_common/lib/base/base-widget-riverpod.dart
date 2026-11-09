import 'package:flutter/material.dart';
import 'package:flutter_lib_common/mixin/auto-dispose.dart';
import 'package:flutter_lib_common/mixin/ui-interaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin LifeCycleEvent {

}

abstract class BaseStateRP extends ConsumerState with AutoDispose, UIInteraction {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context);
}