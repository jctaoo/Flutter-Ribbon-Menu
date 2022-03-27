import "package:flutter/material.dart";

class AuxiliaryPaneNotifier extends ChangeNotifier {
  AuxiliaryPaneNotifier(this.basicAuxiliaryPane) {
    _currentAuxiliaryPane = basicAuxiliaryPane;
  }

  Widget _currentAuxiliaryPane = Container();
  final Widget basicAuxiliaryPane;

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
