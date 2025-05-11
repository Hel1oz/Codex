//packages
import 'package:codex/models/library_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    bool libraryPathNull =
        (context.watch<LibraryModel>().libraryFolderPath == null);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/library.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
            libraryPathNull
                ? Center(
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Library Folder Does not Exist',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.tertiary
                            ),                            
                            onPressed: () {},
                            child: Text(
                              'Create new library folder',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                //how should I show each item?
                //what if I just show the path name as a rudimentary step
                //TODO: Do the grid children design first before doing anything.
                //design principles, have each book have a box that shows different background colors
                //when they are the current book that's being read, it should have a black border,
                //
                //might have to makde another model for this.
                : Container(),
      ),
    );
  }
}
