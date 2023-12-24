import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool isDarkMode() => _isDark;
  static String themeStatus = "status";
  ThemeProvider() {
    getThemeMode();
  }
  Future<void> setThemeMode({required bool themeValue}) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(ThemeProvider.themeStatus, themeValue);
    _isDark = themeValue;
    notifyListeners();
  }

  Future<bool> getThemeMode() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.get(ThemeProvider.themeStatus);
    notifyListeners();
    return _isDark;
  }
}
