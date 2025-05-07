//packages
import 'package:codex/routes/settings_page_pages/apperance_settings.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.expand(child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Theme.of(context).colorScheme.brightness == Brightness.light ? Colors.grey.shade400 : Colors.grey.shade700))
            ),
            width: 150,
            child: SizedBox(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Testing'),
                  ),
                  ListTile(
                    title: Text('Appearance')
                  ),
                  ListTile(
                    title: Text('About Codex')
                  ),
                ],
              )
            )
          ),
          Expanded(child: ApperanceSettings()),
        ],
      )
    ));
  }
}