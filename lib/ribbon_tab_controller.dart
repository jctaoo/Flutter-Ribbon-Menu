import 'package:flutter/material.dart';

/// Controls the selection of a tab, changes the index accordingly and notifies listeners.
class RibbonTabController extends ValueNotifier {
  int _selectedIndex;

  int get selectedIndex {
    return _selectedIndex;
  }

  set selectedIndex(value) {
    _selectedIndex = value;
    notifyListeners();
  }

  RibbonTabController(this._selectedIndex) : super(_selectedIndex);
}
