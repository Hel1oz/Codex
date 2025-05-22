import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class BookModel with ChangeNotifier {
   static const _libraryBoxNameKey = 'Library';
   static const _currentlyReadingKey = 'CURRENTLY_READING';
   static const _libraryFolderKey = 'LIBRARY_FOLDER_PATH';
  
late Box _libraryBox;
String? _currentlyReading;
String? _libraryFolderPath;

String? get currentlyReading => _currentlyReading;

  //!constructor
  BookModel() {
    _libraryBox = Hive.box(_libraryBoxNameKey);
    _currentlyReading = _libraryBox.get(_currentlyReadingKey);
    _libraryFolderPath = _libraryBox.get(_libraryFolderKey);

  }


  //! method to set the path of the currently reading book
  void setCurrentlyReading(String bookName) {
    final file = File('$_libraryFolderPath/$bookName');

    if (!file.existsSync()) {
      print('file chosen for set current reading does not exist, variables used: library path = $_libraryFolderPath, book name = $bookName');
      return;
    } 

    _currentlyReading = '$_libraryFolderPath/$bookName';
    print('currently reading set: path: $_currentlyReading');
    notifyListeners();
  } 

}