import 'package:flutter/material.dart';

class BottomSheetProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemTapped(index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
