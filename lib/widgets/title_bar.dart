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
          border: Border(bottom: BorderSide(
            color: isLightMode ? Colors.grey.shade400 : Colors.grey.shade700
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
  iconNormal: const Color(0xFF805306),
  mouseOver: const Color(0xFFF6A00C),
  mouseDown: const Color(0xFF805306),
  iconMouseOver: const Color(0xFF805306),
  iconMouseDown: const Color(0xFFFFD500),
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: const Color(0xFF805306),
  iconMouseOver: Colors.white,
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
