//local imports
import 'package:codex/models/navigation_provider.dart';
import 'package:codex/models/side_panel_model.dart';

//packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

final List<BoxShadow> boxShadowsLight = [
  BoxShadow(
    color: Colors.grey.shade600,
    offset: Offset(3, 3),
    blurRadius: 2,
    spreadRadius: 1,
  ),

  // //light side
  BoxShadow(
    color: Colors.white,
    offset: Offset(0, -3),
    blurRadius: 2,
    spreadRadius: 1,
  ),
];

final List<BoxShadow> boxShadowsDark = [
  BoxShadow(
    color:Color(0xFF182021),
    offset: Offset(3, 3),
    blurRadius: 2,
    spreadRadius: 1,
  ),

  // //light side
  BoxShadow(
    color: Color(0xFF264447),
    offset: Offset(0, -3),
    blurRadius: 2,
    spreadRadius: 1,
  ),
];

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
  final SvgPicture addBookIconLightMode = SvgPicture.asset(
    'assets/side_panel/navigation/add_book_icon_lightmode.svg',
  );
  final SvgPicture addBookIconDarkMode = SvgPicture.asset(
    'assets/side_panel/navigation/add_book_icon_darkmode.svg',
  );

  @override
  Widget build(BuildContext context) {
    var isLightMode =
        Theme.of(context).colorScheme.brightness == Brightness.light;
    NavButtons selectedButton =
        context.watch<SidePanelModel>().currentFocusButton;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5, left: 8, right: 8),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surface,
              boxShadow:
                  (selectedButton != NavButtons.reading)
                      ? []
                      : isLightMode ? boxShadowsLight : boxShadowsDark,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              elevation: (selectedButton == NavButtons.reading) ? 8.0 : 0,
              child: ListTile(
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: isLightMode ? readingIconDark : readingIconLight,
                ),
                title: Text(
                  'Reading',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () {
                  Provider.of<NavProvider>(
                    context,
                    listen: false,
                  ).changePage(Pages.readingPage);
                  context.read<SidePanelModel>().changeSelectedButton(
                    NavButtons.reading,
                  );
                },
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 30, left: 8, right: 8),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surface,
              boxShadow:
                  (selectedButton != NavButtons.library)
                      ? []
                      : isLightMode ? boxShadowsLight : boxShadowsDark,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              elevation: (selectedButton == NavButtons.library) ? 8.0 : 0,
              child: ListTile(
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: isLightMode ? libraryIconDark : libraryIconLight,
                ),
                title: Text(
                  'Library',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                onTap: () {
                  Provider.of<NavProvider>(
                    context,
                    listen: false,
                  ).changePage(Pages.libraryPage);
                  context.read<SidePanelModel>().changeSelectedButton(
                    NavButtons.library,
                  );
                },
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                //not this one
                selectedColor: Colors.transparent,
                focusColor: Colors.transparent,
                selectedTileColor: Colors.transparent,
              ),
            ),
          ),
        ),
        // SizedBox(height: 50),
      ],
    );
  }
}
