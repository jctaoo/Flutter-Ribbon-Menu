import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:ribbon_menu/buttons/application_menu_button_interface.dart";
import "package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart";
import "package:ribbon_menu/ribbon_styles.dart";

/// Provides a standard button for the application menu.
///
/// [onEnter] provides a function that should run when the mouse enters the
/// widget.
/// This could be used to show a custom auxiliary pane.
class RibbonApplicationMenuButton extends StatelessWidget
    implements IApplicationMenuButton {
  const RibbonApplicationMenuButton({
    required this.icon,
    Key? key,
    this.label = "",
    this.onPressed,
    this.onEnter,
  }) : super(key: key);

  @override
  final String label;
  @override
  final Function()? onPressed;
  @override
  final Icon icon;
  final Function()? onEnter;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        if (onEnter == null) {
          Provider.of<AuxiliaryPaneNotifier>(context, listen: false)
              .resetAuxiliaryPane();
        }
      },
      child: TextButton(
        onPressed: onPressed,
        style: kBasicButtonStyle,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 16,
              ),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
