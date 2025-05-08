import 'package:codex/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart'; 

final _themeBox = Hive.box('AppThemeBox');

Map<String, ThemeData> availableThemes = {
  'LightMode' : lightMode,
  'DarkMode' : darkMode,
};

void saveToDataBase(ThemeData theme) {
  if(theme == lightMode) {
    _themeBox.put('CURRENT_THEME', 'LightMode');
  } else {
    _themeBox.put('CURRENT_THEME', 'DarkMode');
  }
}

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = availableThemes[_themeBox.get('CURRENT_THEME')] ?? lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    saveToDataBase(themeData);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
      saveToDataBase(darkMode);
    } else {
      _themeData = lightMode;
      saveToDataBase(lightMode);
    }
    notifyListeners();
  }
}