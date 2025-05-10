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

    return SizedBox(
      child:
          libraryPathNull
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Library Folder Does not Exist'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LibraryModel>().addNewBook();
                      },
                      child: Text('Create new library folder'),
                    ),
                  ],
                ),
              )
              //how should I show each item?
              //what if I just show the path name as a rudimentary step
              //TODO: Do the grid children design first before doing anything.
                //design principles, have each book have a box that shows different background colors
                //when they are the current book that's being read, it should have a black border,
                //
              //might have to makde another model for this.
              : Center(child: GridView.count(crossAxisCount: 4, children: [],)),
    );
  }
}
