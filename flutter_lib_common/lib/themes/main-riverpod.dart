import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TLThemesRP extends Notifier<int> {

  int _themeIndex = 0;

  ThemeMode _themeMode = ThemeMode.system;


  set themeIndex(int value) {
    _themeIndex = value;
  }
  set themeMode(ThemeMode value) {
    _themeMode = value;
  }
  int get themeIndex => _themeIndex;

  ThemeMode get themeMode => _themeMode;

  void updateMode(bool dark) {
    if (dark) {
      this._themeMode = ThemeMode.dark;
    } else {
      this._themeMode = ThemeMode.light;
    }
  }

  changeTheme(int theme) {
    _themeIndex = theme;
  }

  get primaryColor => [Colors.cyanAccent, Colors.blueAccent, Colors.amberAccent, Colors.pinkAccent][_themeIndex];

  ThemeData get theme => [
        ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColor,
          primaryColorLight: primaryColor,
          dividerColor: Colors.black12,
          indicatorColor: primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor
          )
        ),
        ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColor,
          primaryColorLight: primaryColor,
          dividerColor: Colors.black12,
          indicatorColor: primaryColor,
            appBarTheme: AppBarTheme(
                backgroundColor: primaryColor
            )
        ),
        ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColor,
          primaryColorLight: primaryColor,
          dividerColor: Colors.black12,
          indicatorColor: primaryColor,
            appBarTheme: AppBarTheme(
                backgroundColor: primaryColor
            )
        ),
        ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColor,
          primaryColorLight: primaryColor,
          dividerColor: Colors.black12,
          indicatorColor: primaryColor,
          // brightness: Brightness.dark,// 主要用于暗黑主题
            appBarTheme: AppBarTheme(
                backgroundColor: primaryColor
            )
        )
      ][_themeIndex];

  ThemeData get darkTheme => [
    ThemeData.dark()
  ][0];

  @override
  int build() {
    return 0;
  }

  TLThemesRP();
}
