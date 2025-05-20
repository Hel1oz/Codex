import 'package:codex/models/setting_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTools extends StatelessWidget {
  const SettingsTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          hoverColor: Theme.of(context).colorScheme.tertiary,
          title: Text('UI settings', style: Theme.of(context).textTheme.bodySmall),
          onTap: () {
            context.read<SettingsPageModel>().changeCurrentTab(
              SettingsTabs.appearanceTab,
            );
          },
        ),
        ListTile(title: Text('Storage', style: Theme.of(context).textTheme.bodySmall), onTap: () {}),
        ListTile(
          title: Text('About Codex', style: Theme.of(context).textTheme.bodySmall),
          onTap: () {
            context.read<SettingsPageModel>().changeCurrentTab(
              SettingsTabs.aboutCodexTab,
            );
          },
        ),
      ],
    );
  }
}
