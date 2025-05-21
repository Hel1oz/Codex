import 'package:codex/models/library_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryTools extends StatelessWidget {
  const LibraryTools({super.key});

  @override
  Widget build(BuildContext context) {

    final libraryExists = context.watch<LibraryModel>().libraryFolderPath != null;

    return libraryExists ? Column(
      children: [
        ListTile(
          leading:
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? Icon(Icons.add_sharp, color: Colors.black)
                  : Icon(Icons.add_sharp, color: Colors.white),
          title: Text(
            'Add Book',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ///!Uses file picker directly and uses the result as the argument for the addBook method.
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            ); 

            if (result != null && result.files.single.path != null) {
              ///TODO: Figure out what this means
              context.read<LibraryModel>().addBook(result.files.first.path!);
            };
          },
        ),
      ], 
    ) : SizedBox.expand();
  }
}
