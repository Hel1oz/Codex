//packages
import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class ReadingPage extends StatelessWidget {

  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            ),
          child: PdfViewer.file('C:/Users/red/Documents/CodexLibrary/Things hidden since the foundation of the world.pdf',
          initialPageNumber: 1,
          params: PdfViewerParams(
            enableTextSelection: true,
            backgroundColor: Colors.transparent,
            enableKeyboardNavigation: true,
          ),),
        ),
      );
  }
}