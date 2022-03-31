import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:ribbon_menu/buttons/application_menu_button_interface.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_dropdown_item.dart";
import "package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart";
import "package:ribbon_menu/ribbon_styles.dart";

class RibbonApplicationMenuDropdownButton extends StatelessWidget
    implements IApplicationMenuButton {
  const RibbonApplicationMenuDropdownButton({
    required this.icon,
    required this.items,
    Key? key,
    this.label = "",
    this.onPressed,
  }) : super(key: key);

  @override
  final String label;
  @override
  final Function()? onPressed;
  @override
  final Icon icon;
  final List<RibbonApplicationMenuDropdownItem> items;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        Provider.of<AuxiliaryPaneNotifier>(context, listen: false)
            .setAuxiliaryPane(
          Column(
            children: items,
          ),
        );
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
              const Spacer(),
              const Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
