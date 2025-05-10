import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleBar extends StatelessWidget {
  TitleBar({super.key});

  final SvgPicture codexLogoLightMode = SvgPicture.asset('assets/side_panel/navigation/codex_logo_lightmode.svg');
  final SvgPicture codexLogoDarkMode = SvgPicture.asset('assets/side_panel/navigation/codex_logo_darkmode.svg');

  @override
  Widget build(BuildContext context) {

    bool isLightMode = Theme.of(context).colorScheme.brightness == Brightness.light;

    return WindowTitleBarBox(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border(bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ))
        ),
        child: MoveWindow(
          child: Row(
            children: [Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: isLightMode ? codexLogoLightMode : codexLogoDarkMode,
                ),
              ],
            )), const WindowsButton()],
          ),
        ),
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
  iconNormal: const Color(0xFF000000),
  mouseOver: const Color(0xFF4595b0),
  mouseDown: const Color(0xFF363636),
  iconMouseOver: const Color(0xFF000000),
  iconMouseDown: const Color(0xFF000000),
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFe81123),
  mouseDown: const Color(0xFF4fa0ba),
  iconNormal: const Color(0xFF000000),
  iconMouseOver: const Color(0xFF000000),
);

class WindowsButton extends StatefulWidget {
  const WindowsButton({super.key});

  @override
  State<WindowsButton> createState() => _WindowsButtonState();
}

class _WindowsButtonState extends State<WindowsButton> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
              colors: buttonColors,
              onPressed: maximizeOrRestore,
            )
            : MaximizeWindowButton(
              colors: buttonColors,
              onPressed: maximizeOrRestore,
            ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
