//local imports
import 'package:codex/routes/main_view_port_pages/library_page.dart';
import 'package:codex/routes/main_view_port_pages/reading_page.dart';
import 'package:codex/routes/main_view_port_pages/settings_page.dart';


//packages
import 'package:flutter/material.dart';

class MainViewPort extends StatelessWidget {

  const MainViewPort({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child: Container(

      child: IndexedStack(
        index: 0,
        children: [
          ReadingPage(),
          LibraryPage(),
          SettingsPage(),
        ],
      ),
    ));
  }
}

