import 'package:flutter/material.dart';

class MyLanguageProvider extends ChangeNotifier {
  String language = 'en';
  changeLanguage(String lang) {
    if (language == lang) return;
    language = lang;
    notifyListeners();
  }
}
