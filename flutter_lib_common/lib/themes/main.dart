import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TLThemes with ChangeNotifier {
  int _themeIndex = 0;

  ThemeMode _themeMode = ThemeMode.system;

  changeTheme(int theme) {
    _themeIndex = theme;
    notifyListeners();
  }

  get primaryColor => [Colors.cyanAccent, Colors.blueAccent, Colors.amberAccent, Colors.pinkAccent][_themeIndex];

  get themeIndex => _themeIndex;

  get themeMode => _themeMode;

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


// InheritedWidget有个默认的约定：如果状态是希望暴露出的，应当提供一个 “of” 静态方法来获取其对象，开发者便可直接通过该方法来获取。
// 获取最近的context上下文对象
// 这个静态方法可以获取widget树中最近的Provider<T>，并且返回它的值。如果listen为true,那么随后value发生的变化会触发State.build和
// State.didChangeDependencies. 如果需要在initState中调用Provider.of或者如下调用Provider的create方法时，需要设置listen为false：
// use this method get a object can refresh Style when listen = true, and notifyListeners is called
  static TLThemes getProvider(BuildContext context, {bool listen = true}) {
    return Provider.of<TLThemes>(context, listen: listen);
  }

  void updateMode(bool dark) {
    if (dark) {
      this._themeMode = ThemeMode.dark;
    } else {
      this._themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
