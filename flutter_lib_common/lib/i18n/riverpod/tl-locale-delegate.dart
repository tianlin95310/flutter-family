import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'tl-localizations.dart';

class TlLocalizationsDelegateRP extends LocalizationsDelegate<TlLocalizationsRP> {

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TlLocalizationsRP> old) {
    return false;
  }

  @override
  Future<TlLocalizationsRP> load(Locale locale) {
    return SynchronousFuture(TlLocalizationsRP());
  }

  static const TlLocalizationsDelegateRP delegate = TlLocalizationsDelegateRP();

  const TlLocalizationsDelegateRP();
}