import 'package:flutter/material.dart';

class MyThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  changeTheme(ThemeMode themeMode) {
    if (mode == themeMode) {
      return;
    }
    mode = themeMode;
    notifyListeners();
  }
}
