//packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Settings extends StatelessWidget {

  Settings({super.key});

  final SvgPicture settingsButtonLightmode = SvgPicture.asset('assets/side_panel/settings/settings_icon_lightmode.svg');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  final buttonFont = Theme.of(context).textTheme.labelLarge;

    return ListTile(leading: settingsButtonLightmode, title: Text('Settings',
    style: buttonFont),);
  }
}