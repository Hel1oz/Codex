//packages
import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class ReadingPage extends StatelessWidget {

  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return SizedBox.expand(
        child: PdfViewer.file('C:/Users/red/temp/Atlas_Shrugged.pdf',
        initialPageNumber: 1,
        params: PdfViewerParams(
          enableTextSelection: true,
          
        ),),
      );
  }
}