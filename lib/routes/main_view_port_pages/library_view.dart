import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:codex/models/library_model.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryModel = Provider.of<LibraryModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: FutureBuilder<List<String>>(
        future: libraryModel.getBookNames(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final bookNames = snapshot.data ?? [];
          print('LibraryView: Future completed with ${bookNames.length} book names');

          if (bookNames.isEmpty) {
            return const Center(child: Text('No books available'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: bookNames.length,
            itemBuilder: (context, index) {
              print('LibraryView: Building item $index with book name: ${bookNames[index]}');
              return InkWell(
                onTap: () {
                  context.read<LibraryModel>().setCurrentlyReading(bookNames[index]);
                },
                child: Card(
                  elevation: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        bookNames[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}