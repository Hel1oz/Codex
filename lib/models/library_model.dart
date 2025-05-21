import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

/// Manages the library folder and book data, providing state update via changeNotifir
class LibraryModel with ChangeNotifier {
  
  /// constant variables holding the keys for the library hive box
  static const _libraryFolderKey = 'LIBRARY_FOLDER_PATH';
  static const _currentlyReadingKey = 'CURRENTLY_READING';
  static const _libraryBoxNameKey = 'Library';

  String? _libraryFolderPath;
  String? _currentlyReading;
  late Box _libraryBox;

  ///constructs a [LibraryModel] and initializes it with data from Hive.
  LibraryModel() {
    _libraryBox = Hive.box(_libraryBoxNameKey);
    _libraryFolderPath = _libraryBox.get(_libraryFolderKey);
    _currentlyReading = _libraryBox.get(_currentlyReadingKey);

    //check if the library directory actually exist, if not then make the variables null
    if (_libraryFolderPath != null) {
      final directory = Directory(_libraryFolderPath!);
      if (!directory.existsSync()) {
        _libraryFolderPath = null;
        _libraryBox.put(_libraryFolderKey, null);
      }
    }
    //check if the currently reading file actually exists, if not, then make the variables null
    if (_currentlyReading != null) {
      final file = File(_currentlyReading!);
      if (!file.existsSync()) {
        _currentlyReading = null;
        _libraryBox.put(_currentlyReadingKey, null);
      }
    }
    print('LibraryModel initialized: _libraryFolderPath = $_libraryFolderPath');
  
  }


  ///Getters for the values
  String? get libraryFolderPath => _libraryFolderPath;
  String? get currentlyReading => _currentlyReading;

  void setCurrentlyReading(String bookName) {
    _currentlyReading = '$_libraryFolderPath/$bookName';
    notifyListeners();
  }

  /// a method that checks if the library folder is registered and that it does in fact exists. 
  Future<bool> isLibraryAlive() async {
    if (_libraryFolderPath != null) {
      final directory = Directory(_libraryFolderPath!);
      return await directory.exists();
    }
    return false;
  }

  //this method is used for selecting an existing folder to use as the library folder
  void useExistingFolder({required String path}) async {
    final directory = Directory(path);
    _libraryFolderPath = directory.path;
    _libraryBox.put('LIBRARY_FOLDER_PATH', directory.path);
    notifyListeners();
  }

  //this method is used for creating a new folder and using it as the library folder
  void useNewFolder({required String path, required String folderName}) async {
  try {
    final libraryPath = '$path/$folderName';
    final directory = Directory(libraryPath);

    if (!await directory.exists()) {
      await directory.create(recursive: true);
      print('LibraryModel: Created new directory at $libraryPath');
    }

    _libraryFolderPath = libraryPath;
    _libraryBox.put('LIBRARY_FOLDER_PATH', libraryPath);
    print('LibraryModel: Set library folder to $libraryPath');
    notifyListeners();
  } catch (e) {
    print('LibraryModel: Error creating new folder: $e');
  }
}

  //this method is used for creating a folder in the support directory
  //ideally this should be used by the user
  void useSupportDirectory() async {
  try {
    final supportDirectory = await getApplicationSupportDirectory();
    final libraryPath = '${supportDirectory.path}/Library';
    final directory = Directory(libraryPath);

    if (!await directory.exists()) {
      await directory.create(recursive: true);
      print('LibraryModel: Created library directory at $libraryPath');
    }

    _libraryFolderPath = libraryPath;
    _libraryBox.put('LIBRARY_FOLDER_PATH', libraryPath);
    print('LibraryModel: Set library folder to $libraryPath');
    notifyListeners();
  } catch (e) {
    print('LibraryModel: Error setting support directory: $e');
  }
}

/// this is just a test method that removes turns the libraryp path into null so that I can test if the 
/// other methods for creating  a new library folder works
  void remove() {
    _libraryBox.put(_libraryFolderKey, null);
    _libraryFolderPath = null;
    notifyListeners();
  }


  /// This method gathers the names of the books, I tried doing thumbnails but I ran into some 
  /// problem using pdfx
  Future<List<String>> getBookNames() async {
    print('LibraryModel: _libraryFolderPath = $_libraryFolderPath');
    //I don't think this check would be necessary since if the library path would be null
    //it wouldn't reach the library view
    if (_libraryFolderPath == null) {
      print('LibraryModel: _libraryFolderPath is null, returning empty list');
      return [];
    }

    List<String> filePaths = [];
    final Directory libraryFolder = Directory(_libraryFolderPath!);

    try {
      print('LibraryModel: Listing files in directory: $_libraryFolderPath');
      await for (var entity in libraryFolder.list(recursive: false)) {
        if (entity.path.toLowerCase().endsWith('.pdf')) {
          filePaths.add(entity.path);
          print('LibraryModel: Found PDF: ${entity.path}');
        }
      }
      print('LibraryModel: Total PDFs found: ${filePaths.length}');
    } catch (e) {
      print('LibraryModel: Error listing directory: $e');
      return [];
    }

    if (filePaths.isEmpty) {
      print('LibraryModel: No PDF files found, returning empty list');
      return [];
    }

    // Extract book names from file paths
    List<String> bookNames =
        filePaths.map((path) {
          final fileName =
              path.split(r'\').last; // Get the filename from the path
          return fileName; // Remove the .pdf extension
        }).toList();

    print('LibraryModel: Total book names: ${bookNames.length}');
    return bookNames;
  }

  ///!Add book method, that selects a file and copies it into the library folder, 
  ///?Error handling, let's see. What if the library folder doesn't exist? Well since this button will be available
  ///after the  user has chosen a library folder then that shouldn't be too much of a risk, but
  ///? what if the folder gets erased or something after the user has chosen a folder and before they add a book,
  ///I could just go with code dthat checks if it does exist, I could just use the is alive method
  ///
  
  void addBook(String filePath) async {
    ///? Was? well it checks if the library is online, if it is
    ///? Then it makes a file object referencing the file, it extracts its name, 
    ///? creates a destination path, 
    ///? and copies that file into the destination path.
    if (!await isLibraryAlive()) {
      print('Library Folder is not online');
      return; 
    } else {
      final file = File(filePath);
      final fileName = filePath.split(Platform.pathSeparator).last;
      final destinationPath = '$_libraryFolderPath${Platform.pathSeparator}$fileName';
      file.copySync(destinationPath);
      notifyListeners();
    }

  }
}
