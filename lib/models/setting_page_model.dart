import 'package:codex/routes/settings_page_tabs/about_codex_tab.dart';
import 'package:codex/routes/settings_page_tabs/appearance_tab.dart';
import 'package:flutter/material.dart';

//tabs :
// Appearance
// about codex
//

enum SettingsTabs {
  aboutCodexTab,
  appearanceTab,
}

Map<SettingsTabs, Widget> availableTabs = {
  SettingsTabs.aboutCodexTab : AboutCodexTab(),
  SettingsTabs.appearanceTab : AppearanceSettingsTab(),
};

class SettingsPageModel with ChangeNotifier {

  Widget _currentTab = AboutCodexTab();

  Widget get currentTab => _currentTab;

  void changeCurrentTab(SettingsTabs tab) {
    if (_currentTab != availableTabs[tab]!) {
    _currentTab = availableTabs[tab]!;
    notifyListeners();
    } else {
      return;
    }
  }
}