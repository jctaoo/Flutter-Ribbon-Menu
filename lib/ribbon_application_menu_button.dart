import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_menu/application_menu_button_interface.dart';
import 'package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart';

/// Provides a standard button for the application menu.
///
/// [onEnter] provides a function that should run when the mouse enters the widget.
/// This could be used to show a custom auxiliary pane.
class RibbonApplicationMenuButton extends StatelessWidget implements IApplicationMenuButton {
  @override
  final String label;
  @override
  final Function()? onPressed;
  final Function()? onEnter;
  @override
  final Icon icon;

  const RibbonApplicationMenuButton({
    Key? key,
    this.label = "",
    this.onPressed,
    required this.icon, this.onEnter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        if(onEnter == null) {
          Provider.of<AuxiliaryPaneNotifier>(context, listen: false).resetAuxiliaryPane();
        }
      },
      child: TextButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 16.0,
                ),
                Text(label),
              ],
            ),
          )),
    );
  }
}
