import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      backgroundColor: Color(0xffbb86fc),
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black38,
      iconTheme: IconThemeData(color: Colors.white),
      colorScheme: ColorScheme.dark(secondary: Colors.black87));

  static final lightTheme = ThemeData(
      backgroundColor: Color(0xff6200ee),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white38,
      iconTheme: IconThemeData(color: Colors.black),
      colorScheme: ColorScheme.light());
}
