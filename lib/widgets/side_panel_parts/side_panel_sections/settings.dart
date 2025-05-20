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

    bool isLightMode =
        Theme.of(context).colorScheme.brightness == Brightness.light;

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        boxShadow:
                    (context.watch<SidePanelModel>().currentFocusButton != NavButtons.settings)
                        ? []
                        : [
                          //dark side
                          BoxShadow(
                            color: Color.fromARGB(255, 17, 23, 24),
                            offset: Offset(3, 3),
                            blurRadius: 3,
                            spreadRadius: 1,
                            // inset: true,
                          ),

                          //light side
                          BoxShadow(
                            color: Color(0xFF264447),
                            offset: Offset(-3,-3),
                            blurRadius: 3,
                            spreadRadius: 1,
                            // inset: true,
                          )
                        ],
        
      ),
      child: Material(
        elevation: (context.watch<SidePanelModel>().currentFocusButton == NavButtons.settings) ? 8.0 : 0,
        child: ListTile(
          leading: isLightMode ? settingsButtonLightmode : settingsButtonDarkmode,
          title: Text('Settings', style: Theme.of(context).textTheme.titleSmall),
          onTap: () {
            context.read<NavProvider>().changePage(Pages.settingsPage);
            context.read<SidePanelModel>().changeSelectedButton(
              NavButtons.settings,
            );
          },
        ),
      ),
    );
  }
}
