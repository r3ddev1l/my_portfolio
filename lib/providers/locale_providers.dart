import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.isSupported(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}

class L10n {
  static final all = [const Locale('en'), const Locale('ne')];

  /// Check if the requested locale is supported or not
  static bool isSupported(Locale locale) {
    return all.contains(locale);
  }

  static List<Locale> get supportedLocales => all;
}
