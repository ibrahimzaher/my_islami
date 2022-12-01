import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async =>
      sharedPreferences = await SharedPreferences.getInstance();
  static void setLanguage(String value) async {
    await sharedPreferences.setString('language', value);
    // print(sharedPreferences.getString('language'));
  }

  static String? getLanguage() {
    // print(sharedPreferences.getString('language'));
    return sharedPreferences.getString('language');
  }

  static void setTheme(bool value) async {
    await sharedPreferences.setBool('theme', value);
    // print(sharedPreferences.getBool('theme'));
  }

  static bool? getTheme() {
    // print(sharedPreferences.getBool('theme'));
    return sharedPreferences.getBool('theme');
  }
}
