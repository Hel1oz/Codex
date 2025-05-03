//local imports
import 'package:codex/models/theme_provider.dart';

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApperanceSettings extends StatelessWidget {
  const ApperanceSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ElevatedButton(
        onPressed: () { Provider.of<ThemeProvider>(context, listen: false).toggleTheme();},
        child: Text(
          'Testing: Toggle theme',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
