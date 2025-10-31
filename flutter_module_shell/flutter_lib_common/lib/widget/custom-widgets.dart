import 'package:flutter/rendering.dart';
import 'package:flutter_lib_common/main.dart';
import 'package:flutter/material.dart';

class CustomWidgets extends BaseStatefulWidget {
  State getState() {
    return _CustomWidgetsState();
  }
}

class _CustomWidgetsState extends BasePageTitleState<CustomWidgets> {
  String getTitle(BuildContext context) {
    return I18n.of(context).custom_widget;
  }

  Widget getBody(BuildContext context) {
    return MySingleChildWidget();
  }
}

class MyMultiChildWidget extends MultiChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFlex(children: [
      RenderPadding(padding: EdgeInsets.all(16))
    ]);
  }
}

class MySingleChildWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPadding(padding: EdgeInsets.all(16));
  }
}
