//packages

import 'package:codex/models/setting_page_model.dart';
import 'package:codex/models/side_panel_model.dart';
import 'package:codex/widgets/side_panel_sections/tools_pages.dart/settings_tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tools extends StatelessWidget {

  const Tools({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //this expanded widget is important, it constraints listview
    // return Expanded(child: Container(
    //   color: Colors.blue,
    //   child: ListView(
        
    //   )));
    // Column in the navigation widget needed to be wrapped in a SizedBox widget
    return Expanded(child: Consumer<SidePanelModel>(builder: (BuildContext context, SidePanelModel value, Widget? child) { 
      return value.currentTools;
     },));
  }
}
