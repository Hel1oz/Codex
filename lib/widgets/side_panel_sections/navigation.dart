//local imports
import 'package:codex/models/navigation_provider.dart';
import 'package:codex/models/side_panel_model.dart';

//packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  // final SvgPicture codexLogo = SvgPicture.asset('assets/side_panel/navigation/codex_logo_lightmode.svg');

//Reading icons
  final SvgPicture readingIconDark = SvgPicture.asset(
    'assets/side_panel/navigation/reading_icon_lightmode.svg',
  );
  final SvgPicture readingIconLight = SvgPicture.asset(
    'assets/side_panel/navigation/reading_icon_darkmode.svg',
  );

//Library icons
  final SvgPicture libraryIconDark = SvgPicture.asset(
    'assets/side_panel/navigation/library_icon_lightmode.svg',
  );
  final SvgPicture libraryIconLight = SvgPicture.asset(
    'assets/side_panel/navigation/library_icon_darkmode.svg',
  );

//add book icons
  final SvgPicture addBookIconLightMode = SvgPicture.asset('assets/side_panel/navigation/add_book_icon_lightmode.svg',);
  final SvgPicture addBookIconDarkMode = SvgPicture.asset('assets/side_panel/navigation/add_book_icon_darkmode.svg');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
        set up a container, it should shrink to its child widget, so set column's mainaxissize to minimum, 
        now for the header. How? Just a container? with some padding? Or maybe another list tile and I'll
        just use the title parameter
    */

    var isLightMode = Theme.of(context).colorScheme.brightness == Brightness.light;


    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.secondary))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        //TODO: Check out flexible instead of using a sizedbox
        children: [
          // ListTile(leading: codexLogo),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: ListTile(
                leading: isLightMode ? readingIconDark : readingIconLight,
                title: Text('Reading', style: Theme.of(context).textTheme.titleSmall),
                onTap: () {
                  Provider.of<NavProvider>(
                    context,
                    listen: false,
                  ).changePage(Pages.readingPage);
                  context.read<SidePanelModel>().pressButton(NavButtons.reading);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:0, bottom: 15),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: ListTile(
                leading: isLightMode ? libraryIconDark : libraryIconLight,
                title: Text('Library', style: Theme.of(context).textTheme.titleSmall),
                onTap: () {
                  Provider.of<NavProvider>(
                    context,
                    listen: false,
                  ).changePage(Pages.libraryPage);
                  context.read<SidePanelModel>().pressButton(NavButtons.library);
                },
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
