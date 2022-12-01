import 'package:flutter/material.dart';
import 'package:my_islami/shared_preferences/my_shared_prefernces.dart';

class MyLanguageProvider extends ChangeNotifier {
  String language;
  MyLanguageProvider({required this.language});
  changeLanguage(String lang) {
    if (language == lang) return;
    MySharedPreferences.setLanguage(lang);
    language = lang;
    notifyListeners();
  }
}
