import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tl_flutter_common/base/base-widget.dart';

class SliverComp extends BaseStatefulWidget {
  @override
  State<StatefulWidget> getState() {
    return SliverCompState();
  }
}

class SliverCompState extends BasePageTitleState {

  final _url = 'https://img2.baidu.com/it/u=3202947311,1179654885&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500';
  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      ),
    );
  }
}
