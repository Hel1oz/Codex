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
            width: 150,
            color: Colors.deepOrange,
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