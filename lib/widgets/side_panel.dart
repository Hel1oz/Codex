//packages

import 'package:codex/widgets/side_panel_sections/navigation.dart';
import 'package:codex/widgets/side_panel_sections/settings.dart';
import 'package:codex/widgets/side_panel_sections/tools.dart';
import 'package:flutter/material.dart';

class SidePanel extends StatelessWidget {
  
  const SidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    //double.infinity or crossAxisAlignment of the Row widget?
    return SizedBox(
      width: 200,
      height: double.infinity,
      child: Column(
        children: [
          const Navigation(),
          const Tools(),
          const Settings(),
        ],
      ),
    );
  }
}
