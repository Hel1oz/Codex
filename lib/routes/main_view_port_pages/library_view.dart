//packages

import 'package:codex/models/library_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: ElevatedButton(onPressed: () {context.read<LibraryModel>().remove();}, child: Text('Reset'))
      )
    );
  }
}


//TODO: Refactor this code, simpler, and move to other files perhaps.
