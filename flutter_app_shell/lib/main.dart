import 'package:flutter/material.dart';
import 'package:flutter_biz_setting/main.dart';
import 'package:flutter_lib_common/main.dart';
import 'package:flutter_biz_main/main.dart';

final Map<String, WidgetBuilder> visitRoutes = {
  ...mainRoutes,
};

final Map<String, WidgetBuilder> authRoutes = {
  ...settingRoutes,
  ...commonRoutes
};

void main() async {
  // read app setting data
  runApp(MyApp(visitRoutes, authRoutes, const {
    'theme': 0,
    'language': 'en-US'
  }));
}

