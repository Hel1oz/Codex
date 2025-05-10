//local import
import 'package:codex/models/navigation_provider.dart';
import 'package:codex/models/side_panel_model.dart';

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

    bool isLightMode = Theme.of(context).colorScheme.brightness == Brightness.light;

    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Theme.of(context).colorScheme.secondary))),
      child: ListTile(
        leading: isLightMode ? settingsButtonLightmode : settingsButtonDarkmode,
        title: Text('Settings', style: Theme.of(context).textTheme.titleSmall),
        onTap: () {
          Provider.of<NavProvider>(
            context,
            listen: false,
          ).changePage(Pages.settingsPage);
          context.read<SidePanelModel>().pressButton(NavButtons.settings);
        },
      ),
    );
  }
}
