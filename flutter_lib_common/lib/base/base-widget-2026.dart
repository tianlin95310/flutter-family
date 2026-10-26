import 'package:flutter/material.dart';

mixin LifeCycleEvent {

}

abstract class BaseState2026 extends State {

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