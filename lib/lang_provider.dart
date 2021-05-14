import 'package:flutter/cupertino.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  Locale get locale => _locale;
}
