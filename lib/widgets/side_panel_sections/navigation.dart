//packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navigation extends StatelessWidget {

  const Navigation({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
        set up a container, it should shrink to its child widget, so set column's mainaxissize to minimum, 
        now for the header. How? Just a container? with some padding? Or maybe another list tile and I'll
        just use the title parameter
    */

    final SvgPicture codexLogo = SvgPicture.asset('assets/side_panel/navigation/codex_logo_lightmode.svg');
    
    final SvgPicture readingIcon = SvgPicture.asset('assets/side_panel/navigation/reading_icon_lightmode.svg');

    final SvgPicture libraryIcon = SvgPicture.asset('assets/side_panel/navigation/library_icon_lightmode.svg');

    final SvgPicture addBookIcon = SvgPicture.asset('assets/side_panel/navigation/add_book_icon_lightmode.svg');

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        //TODO: Check out flexible instead of using a sizedbox
        children: [
          ListTile(leading: codexLogo),
          ListTile(leading: readingIcon, title: Text('Reading')),
          ListTile(leading: libraryIcon, title: Text('Library')),
          SizedBox(height: 50),
          ListTile(leading: addBookIcon, title: Text('Add Book'))
        ],
      ),
    );
  }
}
