import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib_common/i18n/provider/tl-localizations.dart';

class TlLocalizationsDelegate extends LocalizationsDelegate<TlLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TlLocalizations> old) {
    return false;
  }

  @override
  Future<TlLocalizations> load(Locale locale) {
    return SynchronousFuture(TlLocalizations(locale));
  }

  static const TlLocalizationsDelegate delegate = TlLocalizationsDelegate();

  const TlLocalizationsDelegate();
}