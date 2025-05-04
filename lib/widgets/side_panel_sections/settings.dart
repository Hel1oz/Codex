//local import
import 'package:codex/models/navigation_provider.dart';

//packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final SvgPicture settingsButtonLightmode = SvgPicture.asset(
    'assets/side_panel/settings/settings_icon_lightmode.svg',
  );
  final SvgPicture settingsButtonDarkmode = SvgPicture.asset(
    'assets/side_panel/settings/settings_icon_darkmode.svg',
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final buttonFont = Theme.of(context).textTheme.labelLarge;
    bool isLightMode = Theme.of(context).colorScheme.brightness == Brightness.light;

    return ListTile(
      leading: isLightMode ? settingsButtonLightmode : settingsButtonDarkmode,
      title: Text('Settings', style: buttonFont),
      onTap: () {
        Provider.of<NavProvider>(
          context,
          listen: false,
        ).changePage(Pages.settingsPage);
      },
    );
  }
}
