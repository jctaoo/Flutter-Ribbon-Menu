import 'package:flutter/material.dart';

class ApplicationMenuToggle extends InheritedWidget {
  final Function() closeFunction;

  const ApplicationMenuToggle({Key? key, required Widget child, required this.closeFunction}) : super(key: key, child: child);

  static ApplicationMenuToggle of(BuildContext context) {
    final ApplicationMenuToggle? result = context.dependOnInheritedWidgetOfExactType<ApplicationMenuToggle>();
    assert(result != null, 'No ApplicationMenuToggle found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ApplicationMenuToggle oldWidget) => true;

}