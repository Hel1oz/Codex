//packages
import 'package:flutter/material.dart';

//local widgets
import 'package:codex/widgets/main_view_port.dart';
import 'package:codex/widgets/side_panel.dart';




class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    //is expanded necessary here?
    return Expanded( //This expanded somehow made the app work by giving constraints
      child: Row(
        children: [const SidePanel(), const MainViewPort()],),
    );
  }
}
