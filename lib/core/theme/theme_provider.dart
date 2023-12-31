import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDarkMode => _isDark;
  static const themeStatus = "status";
  ThemeProvider() {
    getThemeMode();
  }
  Future<void> setThemeMode({required bool themeValue}) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(themeStatus, themeValue);
    _isDark = themeValue;
    notifyListeners();
  }

  Future<bool> getThemeMode() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _isDark = sharedPref.getBool(themeStatus) ?? false;
    notifyListeners();
    return _isDark;
  }
}
