import 'package:flutter/material.dart';

class AuxiliaryPaneNotifier extends ChangeNotifier {
  Widget _currentAuxiliaryPane = Container();
  final Widget basicAuxiliaryPane;

  AuxiliaryPaneNotifier(this.basicAuxiliaryPane) {
    _currentAuxiliaryPane = basicAuxiliaryPane;
  }

  Widget get auxiliaryPane {
    return _currentAuxiliaryPane;
  }

  void setAuxiliaryPane(Widget value) {
    _currentAuxiliaryPane = value;
    notifyListeners();
  }

  void resetAuxiliaryPane() {
    _currentAuxiliaryPane = basicAuxiliaryPane;
    notifyListeners();
  }

}