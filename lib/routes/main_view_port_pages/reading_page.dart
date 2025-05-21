//packages
import 'dart:math';

import 'package:codex/models/library_model.dart';
import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:provider/provider.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  /// Page reading order; true to L-to-R that is commonly used by books like manga or such
  final isRightToLeftReadingOrder = false;

  /// Use the first page as cover page
  final needCoverPage = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        //colorFiltered widget flips the colors, if you implement this, make sure to whiten the background.
        child: PdfViewer.file(
          context.watch<LibraryModel>().currentlyReading!,
          initialPageNumber: 1,
          params: PdfViewerParams(
            enableTextSelection: true,
            backgroundColor: Colors.transparent,
            enableKeyboardNavigation: true,
            layoutPages: (pages, params) {
              final height =
                  pages.fold(0.0, (prev, page) => max(prev, page.height)) +
                  params.margin * 2;
              final pageLayouts = <Rect>[];
              double x = params.margin;
              for (final page in pages) {
                pageLayouts.add(
                  Rect.fromLTWH(
                    x,
                    (height - page.height) / 2, // center vertically
                    page.width,
                    page.height,
                  ),
                );
                x += page.width + params.margin;
              }
              return PdfPageLayout(
                pageLayouts: pageLayouts,
                documentSize: Size(x, height),
              );
            },
          ),
        ),
      ),
    );
  }
}
