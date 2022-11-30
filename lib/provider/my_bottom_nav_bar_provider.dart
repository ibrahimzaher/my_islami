import 'package:flutter/material.dart';
import 'package:my_islami/tabs/hades/hades_tab.dart';
import 'package:my_islami/tabs/quran/quran_tab.dart';
import 'package:my_islami/tabs/radio/radio_tab.dart';
import 'package:my_islami/tabs/sebha/sebha_tab.dart';
import 'package:my_islami/tabs/settings/settings_tab.dart';

class MyBottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadesTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  changeIndex(index) {
    if (currentIndex == index) return;
    currentIndex = index;
    notifyListeners();
  }
}
