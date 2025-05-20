import 'package:codex/widgets/side_panel_parts/tools_pages.dart/library_tools.dart';
import 'package:codex/widgets/side_panel_parts/tools_pages.dart/reading_tools.dart';
import 'package:codex/widgets/side_panel_parts/tools_pages.dart/settings_tools.dart';
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

  NavButtons _selectedButton = NavButtons.reading;

  NavButtons get currentFocusButton => _selectedButton;
  Widget get currentTools => toolsTabsMap[_selectedButton]!;

  void changeSelectedButton(NavButtons button) {
    _selectedButton = button;
    notifyListeners();
  }

}