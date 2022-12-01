import 'package:flutter/material.dart';
import 'package:my_islami/shared_preferences/my_shared_prefernces.dart';

class MyThemeProvider extends ChangeNotifier {
  ThemeMode mode;
  MyThemeProvider({required this.mode});
  changeTheme(ThemeMode themeMode) {
    if (mode == themeMode) {
      return;
    }
    mode = themeMode;
    if (mode == ThemeMode.light) {
      MySharedPreferences.setTheme(true);
    } else {
      MySharedPreferences.setTheme(false);
    }
    notifyListeners();
  }
}
