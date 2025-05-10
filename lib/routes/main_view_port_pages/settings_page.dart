import 'package:codex/models/setting_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsPageModel(),
      child: SizedBox.expand(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
              ),
              width: 150,
              child: Builder(
                builder: (BuildContext newContext) { // New context inside ChangeNotifierProvider
                  return ListView(
                    children: [
                      ListTile(
                        title: const Text('Testing'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Appearance'),
                        onTap: () {
                          newContext
                              .read<SettingsPageModel>()
                              .changeCurrentTab(SettingsTabs.appearanceTab); // Fixed method name
                        },
                      ),
                      ListTile(
                        title: const Text('About Codex'),
                        onTap: () {
                          newContext
                              .read<SettingsPageModel>()
                              .changeCurrentTab(SettingsTabs.aboutCodexTab); // Fixed method name
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Consumer<SettingsPageModel>(
                builder: (context, settingsPageModel, child) {
                  return settingsPageModel.currentTab;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}