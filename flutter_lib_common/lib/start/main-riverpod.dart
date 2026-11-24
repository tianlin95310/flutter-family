import 'package:flutter/material.dart';
import 'package:flutter_lib_common/i18n/riverpod/tl-locale-delegate.dart';
import 'package:flutter_lib_common/i18n/riverpod/tl-localizations.dart';
import 'package:flutter_lib_common/themes/main-riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final themeProvider = NotifierProvider<TLThemesRP, int>(TLThemesRP.new);

final localizationsProvider = NotifierProvider<TlLocalizationsRP, Locale>(TlLocalizationsRP.new);

class MyAppRiverPod extends StatelessWidget {
  final RouterConfig<Object> _routerConfig;
  final Map config;

  const MyAppRiverPod(this.config, this._routerConfig);

  @override
  Widget build(BuildContext context) {
    print('MyApp build');

    return ProviderScope(
      child: Builder(
        builder: (BuildContext context) {
          print('ProviderScope build');
          return Consumer(
            builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
              final themes = ref.read(themeProvider.notifier);
              final localizations = ref.read(localizationsProvider.notifier);

              int theme = config['theme'] ?? 1;
              String language = config['language'] ?? 'zh-CN';

              themes.changeTheme(theme);
              if (language == 'zh-CN') {
                localizations.locale = Locale("zh", 'CN');
              } else if (language == 'en-US') {
                localizations.locale = Locale("en", 'US');
              }
              print('---themes & localizations Consumed---');
              return MaterialApp.router(
                routerConfig: _routerConfig,
                title: 'Flutter Demo',
                theme: themes.theme,
                darkTheme: themes.darkTheme,
                // highContrastTheme: ,
                // highContrastDarkTheme: ,
                themeMode: themes.themeMode,
                // themeMode determines theme and darkTheme which be used, the default is ThemeMode.system
                // initialRoute: 'home',
                // routes: visitRoutes,
                // app进入任务列表菜单后的标题
                onGenerateTitle: (BuildContext context) {
                  return localizations.appTitle;
                },
                // 未注册的动态路由
                // onGenerateRoute: (RouteSettings settings) {
                //   print('---onGenerateRoute---');
                //   String routeName = settings.name ?? 'NotFoundPage';
                //   Function builder = authRoutes[routeName] ?? (BuildContext context) => NotFoundPage();
                //   if (settings.arguments != null) {
                //     return CupertinoPageRoute(
                //       settings: settings,
                //       builder: (BuildContext context) {
                //         return builder(context, arguments: settings.arguments);
                //       },
                //     );
                //   } else {
                //     return CupertinoPageRoute(
                //         settings: settings,
                //         builder: (BuildContext context) {
                //           return builder(context);
                //         });
                //   }
                // },
                // onUnknownRoute: (RouteSettings settings) {
                //   print('---onUnknownRoute---');
                //   print(settings.toString());
                //   WidgetBuilder builder = authRoutes['NotFoundPage'] ?? (BuildContext context) => NotFoundPage();
                //   return CupertinoPageRoute(settings: settings, builder: builder);
                // },
                locale: localizations.locale,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  TlLocalizationsDelegateRP.delegate,
                  RefreshLocalizations.delegate,
                ],
                localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
                  print('---localeResolutionCallback---');
                  print(locale?.languageCode);
                  if (locale == null) {
                    return locale;
                  }
                  if (locale.languageCode == 'zh') {
                    return Locale('zh', 'CN');
                  } else {
                    return locale;
                  }
                },
                supportedLocales: [Locale("en"), Locale("zh")],
              );
            },
          );
        },
      ),
    );
  }
}
