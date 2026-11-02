import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../language/zh.dart';
import '../language/en.dart';

class TlLocalizationsRP extends Notifier<Locale> {
  late Locale _locale;

  TlLocalizationsRP();

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
  }

  String get main => $('main');
  String get news => $('news');
  String get mine => $('mine');
  String get themeSetting => $('themeSetting');
  String get languageSetting => $('languageSetting');
  String get chinese => $('chinese');
  String get english => $('english');
  String get product => $('product');
  String get cart => $('cart');
  String get custom_widget => $('custom_widget');
  String get appTitle => $('custom_widget');

  // 用于获取文字信息
  static TlLocalizationsRP of(BuildContext context) {
    return Localizations.of(context, TlLocalizationsRP);
  }

  $(String key){
    return _localizedValues[_locale.languageCode][key] ?? key ?? '';
  }
  static Map _localizedValues = {...en, ...zh};

  @override
  Locale build() {
    return Locale("zh", 'CN');
  }
}
