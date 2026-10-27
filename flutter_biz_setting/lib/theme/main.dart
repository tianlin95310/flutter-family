import 'package:flutter/material.dart';
import 'package:flutter_lib_common/main.dart';

class ThemeSetting extends BaseStatefulWidget {
  @override
  State<StatefulWidget> getState() {
    return ThemeSettingState();
  }
}

class ThemeSettingState extends BasePageTitleState {
  @override
  String getTitle(BuildContext context) {
    return I18n.of(context).themeSetting;
  }

  Widget getItem(Color themeColor, int themeIndex) {
    return Container(
      width: 80,
      height: 100,
      child: Card(
        color: themeColor,
        child: Offstage(
          offstage: TLThemes.getProvider(context).themeIndex != themeIndex,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget getBody(BuildContext context) {
    print('ThemeSetting 刷新');
    // 通过此种方式也能获取到参数，但是取值时机存在限制，需要context
    print(ModalRoute.of(context)?.settings.arguments);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('使用暗黑主题'),
              Switch(value: TLThemes.getProvider(context, listen: false).themeMode == ThemeMode.dark, onChanged: (value){
                print(value);
                if (value) {
                  TLThemes.getProvider(context, listen: false).updateMode(true);
                } else {
                  TLThemes.getProvider(context, listen: false).updateMode(false);
                }
              })
            ],
          ),
          Offstage(
            offstage: TLThemes.getProvider(context, listen: false).themeMode == ThemeMode.dark,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // 因为“建立依赖”这个动作依赖于 Widget 的构建上下文，listen: true 在以下场景会出问题：

                    // 在 initState 中使用 listen: true 会抛出运行时异常。因为此时 initState 阶段还不能建立 InheritedWidget 依赖。
                    // 正确做法是在 initState 里用 listen: false 读取，或把逻辑移到 didChangeDependencies。

                    // 在事件回调（如 onPressed）中使用 listen: true 没有意义且可能报错。回调触发时并不处于构建流程，
                    // 建立依赖不会带来任何重建收益，应一律用 listen: false。
                    TLThemes.getProvider(context, listen: false).changeTheme(0);
                  },
                  child: getItem(Colors.cyanAccent, 0),
                ),
                GestureDetector(
                  onTap: () {
                    TLThemes.getProvider(context, listen: false).changeTheme(1);
                  },
                  child: getItem(Colors.blueAccent, 1),
                ),
                GestureDetector(
                  onTap: () {
                    TLThemes.getProvider(context, listen: false).changeTheme(2);
                  },
                  child: getItem(Colors.amberAccent, 2),
                ),
                GestureDetector(
                  onTap: () {
                    TLThemes.getProvider(context, listen: false).changeTheme(3);
                  },
                  child: getItem(Colors.pinkAccent, 3),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
