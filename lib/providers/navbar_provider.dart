import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  int _activeIndex = 0;

  int get acitveIndex => _activeIndex;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}
