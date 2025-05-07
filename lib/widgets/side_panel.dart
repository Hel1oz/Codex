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
    //without the expanded widget wrapping the side panel and main_port_view, double.infinity causes an exception
    return SizedBox(
      width: 200,
      child: Container(
        decoration: BoxDecoration(border: Border(right: BorderSide(color: Theme.of(context).colorScheme.brightness == Brightness.light ? Colors.grey.shade400 : Colors.grey.shade700),)),
        child: Column(
          children: [
            Navigation(),
            const Tools(),
            Settings(),
          ],
        ),
      ),
    );
  }
}
