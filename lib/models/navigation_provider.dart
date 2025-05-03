//local imports

//packages
import 'package:flutter/material.dart';

enum Pages { readingPage, libraryPage, settingsPage }

const pageIndex = {
  Pages.readingPage: 0,
  Pages.libraryPage: 1,
  Pages.settingsPage: 2,
};

class NavProvider with ChangeNotifier {
  int _currentPageIndex = pageIndex[Pages.readingPage] as int;

  int get currentPageIndex => _currentPageIndex;

  void changePage(Pages page) {
    _currentPageIndex = pageIndex[page] as int;
    notifyListeners();
  }
}
