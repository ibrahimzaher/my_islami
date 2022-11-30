import 'package:flutter/material.dart';

class MySebhaProvider extends ChangeNotifier {
  int counter = 0;
  double angle = 0;
  List<String> values = [
    'سُبْحَانَ اللَّهِ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللهَّ',
    'الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ',
    'أستغفر الله',
    'الْلَّهُ أَكْبَرُ',
  ];
  int index = 0;
  changeCounter() {
    counter++;
    angle += 12;
    if (counter % 33 == 0) {
      index++;
      angle = 0;
      if (index == 5) index = 0;
    }
    notifyListeners();
  }
}
