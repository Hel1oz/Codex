import 'package:codex/models/setting_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Consumer<SettingsPageModel>(
        builder: (context, settingsPageModel, child) {
          return settingsPageModel.currentTab;
        },
      ),
    );
  }
}
