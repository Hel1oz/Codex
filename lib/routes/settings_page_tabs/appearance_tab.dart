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
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            shape: ContinuousRectangleBorder(),
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Theme Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                DropdownButton(
                  padding: EdgeInsets.all(8),
                  isExpanded: false,
                  value: context.watch<ThemeProvider>().chosenThemeMode,
                  items: const [
                  DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                  DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
                  DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
                ], onChanged: (ThemeMode? value) { context.read<ThemeProvider>().setThemeMode(value!);},),
              ],),
            )
          ),
        ),
      ],
    );
  }
}

// Todo:

// button selected color implementation
//     side panel and settings button nav
// appearance settings tab UI implementation
// figure out library system