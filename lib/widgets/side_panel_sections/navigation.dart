//packages

import 'package:codex/models/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  // final SvgPicture codexLogo = SvgPicture.asset('assets/side_panel/navigation/codex_logo_lightmode.svg');

  final SvgPicture readingIcon = SvgPicture.asset(
    'assets/side_panel/navigation/reading_icon_lightmode.svg',
  );

  final SvgPicture libraryIcon = SvgPicture.asset(
    'assets/side_panel/navigation/library_icon_lightmode.svg',
  );

  final SvgPicture addBookIcon = SvgPicture.asset(
    'assets/side_panel/navigation/add_book_icon_lightmode.svg',
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
        set up a container, it should shrink to its child widget, so set column's mainaxissize to minimum, 
        now for the header. How? Just a container? with some padding? Or maybe another list tile and I'll
        just use the title parameter
    */

    final buttonFont = Theme.of(context).textTheme.labelLarge;

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        //TODO: Check out flexible instead of using a sizedbox
        children: [
          // ListTile(leading: codexLogo),
          ListTile(
            leading: readingIcon,
            title: Text('Reading', style: buttonFont),
            onTap: () {
              Provider.of<NavProvider>(
                context,
                listen: false,
              ).changePage(Pages.readingPage);
            },
          ),
          ListTile(
            leading: libraryIcon,
            title: Text('Library', style: buttonFont),
            onTap: () {
              Provider.of<NavProvider>(
                context,
                listen: false,
              ).changePage(Pages.libraryPage);
            },
          ),
          SizedBox(height: 50),
          ListTile(
            leading: addBookIcon,
            title: Text('Add Book', style: buttonFont),
          ),
        ],
      ),
    );
  }
}
