import 'package:flutter/material.dart';
//这种方式只导入部分的export
// import 'package:flutter_lib_common/start/main.dart';
// 导入入口的话则会导入全部的export
import 'package:flutter_lib_common/main.dart';
import 'package:flutter_biz_main/main.dart';
import 'package:flutter_biz_setting/main.dart';

final Map<String, WidgetBuilder> visitRoutes = {
  ...mainRoutes,
};

final Map<String, WidgetBuilder> authRoutes = {
  ...settingRoutes,
  ...commonRoutes
};

void main() async {
  // read app setting data
  runApp(MyApp2026(visitRoutes, authRoutes, const {
    'theme': 0,
    'language': 'en-US'
  }));
}

