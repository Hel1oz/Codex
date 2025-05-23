//packages
import 'dart:ui';
import 'package:codex/models/book_model.dart';
import 'package:codex/models/library_model.dart';
import 'package:codex/models/setting_page_model.dart';
import 'package:codex/models/side_panel_model.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
//local widgets
import 'package:codex/widgets/title_bar.dart';
import 'package:codex/models/navigation_provider.dart';
import 'package:codex/models/theme_provider.dart';
import 'package:codex/widgets/main_section.dart';
import 'package:codex/theme.dart';

void main() async {

  bool _noStartError = true;

  WidgetsFlutterBinding.ensureInitialized(); 
  final supportDirectory = await getApplicationSupportDirectory();

  
    await Hive.initFlutter(supportDirectory.path);
    await Hive.openBox('AppThemeBox');
    await Hive.openBox('Library');

    
    runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => NavProvider()),
      ChangeNotifierProvider(create: (context) => LibraryModel()),
      ChangeNotifierProvider(create: (context) => SettingsPageModel()),
      ChangeNotifierProvider(create: (context) => SidePanelModel()),
      ChangeNotifierProvider(create: (context) => BookModel())
    ],
    child: Codex(noStartError: _noStartError)));

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
  
  final bool _noStartError;

  const Codex({super.key, required bool noStartError}) : _noStartError = noStartError;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: context.watch<ThemeProvider>().chosenThemeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: Colors.black,
          width: 1,
          child: Column(children: [TitleBar(), if(_noStartError) MainSection() else ErrorScreen()]),
        ),
      ),
    );
  }
}


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('An error has occured attempting to start the app')
      ),
    );
  }

}