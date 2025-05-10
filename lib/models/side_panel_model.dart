import 'package:codex/widgets/side_panel_sections/tools_pages.dart/library_tools.dart';
import 'package:codex/widgets/side_panel_sections/tools_pages.dart/reading_tools.dart';
import 'package:codex/widgets/side_panel_sections/tools_pages.dart/settings_tools.dart';
import 'package:flutter/material.dart';

enum NavButtons {
  reading,
  library,
  settings,
}

Map<NavButtons, Widget> toolsTabsMap = {
  NavButtons.reading : ReadingTools(),
  NavButtons.library : LibraryTools(),
  NavButtons.settings : SettingsTools(),
};

class SidePanelModel with ChangeNotifier {
  
  Widget _currentToolsTab = SettingsTools();

  Widget get currentToolsTab => _currentToolsTab;

  void switchCurrentTools(NavButtons tab) {
    _currentToolsTab = toolsTabsMap[tab]!;
    notifyListeners();
  }

  void pressButton(NavButtons button) {
    switchCurrentTools(button);
    notifyListeners();
  }
}