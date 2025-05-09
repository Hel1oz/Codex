import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart'; 

final _themeBox = Hive.box('AppThemeBox');

void saveToDataBase(String theme) {
  _themeBox.put('CHOSEN_THEME_MODE', theme);
}

Map<String, ThemeMode> availableThemeModes = {
  'light' : ThemeMode.light,
  'dark' : ThemeMode.dark,
  'system' : ThemeMode.system,
};

class ThemeProvider with ChangeNotifier {

  ThemeMode _chosenThemeMode = availableThemeModes[_themeBox.get('CHOSEN_THEME_MODE')] ?? ThemeMode.light;  

  ThemeMode get chosenThemeMode => _chosenThemeMode;

  void setThemeMode(ThemeMode themeMode) {
    if(_chosenThemeMode == themeMode) {
      return;
    } else {
      switch (themeMode) {
          case ThemeMode.light:
          _chosenThemeMode = themeMode;
          saveToDataBase('light');
          break;
          case ThemeMode.dark:
          _chosenThemeMode = themeMode;
          saveToDataBase('dark');
          break;
          case ThemeMode.system:
          _chosenThemeMode = themeMode;
          saveToDataBase('system');
          break;
      }
      notifyListeners();
    }
  }
}