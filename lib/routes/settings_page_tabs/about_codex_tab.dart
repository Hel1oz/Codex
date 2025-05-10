import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class AboutCodexTab extends StatelessWidget {
  
  const AboutCodexTab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/About Codex.md'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MarkdownWidget(
              data: snapshot.data!,
              padding: const EdgeInsets.all(25.0),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading about.md'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
  }

}