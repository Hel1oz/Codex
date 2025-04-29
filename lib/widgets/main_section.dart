//packages

import 'package:codex/widgets/main_view_port.dart';
import 'package:codex/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [const SidePanel(), const MainViewPort()],);
  }
}
