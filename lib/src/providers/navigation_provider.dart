import 'package:flutter/material.dart';

enum PageName { homePage, myPage }

class NavigationProvider with ChangeNotifier {
  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
