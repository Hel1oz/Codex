//packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';
//local widgets
import 'package:codex/widgets/title_bar.dart';
import 'package:codex/models/navigation_provider.dart';
import 'package:codex/models/theme_provider.dart';
import 'package:codex/widgets/main_section.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox('AppThemeBox');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => NavProvider()),
    ],
    child: const Codex()));

  final displaySize =
      PlatformDispatcher.instance.views.first.physicalSize /
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  doWhenWindowReady(() {
    //minimum window size is half the device's screen width and 80 percent of the height
    appWindow.minSize = Size(displaySize.width / 2, displaySize.height * 0.8);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class Codex extends StatelessWidget {
  const Codex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: Colors.black,
          width: 1,
          child: Column(children: [TitleBar(), const MainSection()]),
        ),
      ),
    );
  }
}
