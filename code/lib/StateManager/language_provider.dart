import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage;

  LanguageProvider(Locale deviceLocale)
      : _currentLanguage = deviceLocale.languageCode == 'nl' ? 'Dutch' : 'English';

  String get currentLanguage => _currentLanguage;

  void changeLanguage(String language) {
    _currentLanguage = language;
    notifyListeners();
  }
}
