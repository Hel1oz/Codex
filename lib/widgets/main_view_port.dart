//local imports
//I think the reason why it's importing is because it needs the enums
import 'package:codex/models/navigation_provider.dart';
import 'package:codex/routes/main_view_port_pages/library_page.dart';
import 'package:codex/routes/main_view_port_pages/reading_page.dart';
import 'package:codex/routes/main_view_port_pages/settings_page.dart';

//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainViewPort extends StatelessWidget {
  const MainViewPort({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        child: Consumer<NavProvider>(
          builder: (context, navProvider, child) {
            return IndexedStack(
              index: navProvider.currentPageIndex,
              children: [ReadingPage(), LibraryPage(), SettingsPage()],
            );
          },
        ),
      ),
    );
  }
}
