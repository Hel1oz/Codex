import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

final _libraryBox = Hive.box('Library');

class LibraryModel with ChangeNotifier {
  String? _libraryFolderPath = _libraryBox.get('LIBRARY_FOLDER_PATH');
  List books = _libraryBox.get('BOOKS') ?? [];
  String? _currentlyReading = _libraryBox.get('CURRENTLY_READING');

  String? get libraryFolderPath => _libraryFolderPath;

  void createNewFolder(String folderName) async {
    final documentPath = await getApplicationDocumentsDirectory();
    final directoryPath = '${documentPath.path}/$folderName';
    final directory = Directory(directoryPath);

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    _libraryFolderPath = directory.path;
    _libraryBox.put('LIBRARY_FOLDER_PATH', directory.path);
    notifyListeners();
  }

  void saveToDataBase(String filePath) {
    books.add(filePath);
    _libraryBox.put('BOOKS', books);
  }

  void addNewBook() async {
    if (_libraryFolderPath == null) {
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'epub', 'mobi'],
    ); //pick a file, place it in result

    if (result != null && result.files.single.path != null) {
      //check if result is not actually empty, and the a single file has actually been picked

      //create a handle for that file.
      File sourceFile = File(result.files.single.path!);

      String fileName = result.files.single.name;
      String destinationPath = '$_libraryFolderPath/$fileName';

      try {
        await sourceFile.copy(destinationPath);

        //TODO: Create the function to add the file into the list stored in hive.
        saveToDataBase(destinationPath);
        notifyListeners();
      } catch (e) {
        print('error copying file to library folder: $e');
      }
    }
    //copy that file into the folder check to make sure there is in fact a folder,

    //pick a file, copy it to the folder check if the folder actually exists, and then place the path in the
    //hive list.
  }
  //let me assume the folder exists,
  // I'll just show the books for now.

  //I could store it in a list in the hive box
  //hive box KEYS:
  //currentlyReading
  //List of all available books
  //library folder file path
  //
  //categories is another thing but I'll worry about that later.
}
