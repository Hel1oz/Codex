//local imports
import 'package:codex/models/theme_provider.dart';

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppearanceSettingsTab extends StatelessWidget {
  const AppearanceSettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement a way for the user to select either dark mode, light mode or system theme.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {context.read<ThemeProvider>().setThemeMode(ThemeMode.light);}, child: Text('Light')),
        ElevatedButton(onPressed: () {context.read<ThemeProvider>().setThemeMode(ThemeMode.dark);}, child: Text('Dark')),
        ElevatedButton(onPressed: () {context.read<ThemeProvider>().setThemeMode(ThemeMode.system);}, child: Text('System')),
      ],
    );
  }
}
