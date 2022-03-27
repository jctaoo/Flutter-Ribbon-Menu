import "package:flutter/material.dart";

class ApplicationMenuToggle extends InheritedWidget {
  const ApplicationMenuToggle(
      {required Widget child, required this.closeFunction, Key? key,})
      : super(key: key, child: child);

  final Function() closeFunction;

  static ApplicationMenuToggle of(BuildContext context) {
    var result =
        context.dependOnInheritedWidgetOfExactType<ApplicationMenuToggle>();
    assert(result != null, "No ApplicationMenuToggle found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ApplicationMenuToggle oldWidget) => true;
}
