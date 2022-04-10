import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_dropdown_item.dart";
import "package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart";
import "package:ribbon_menu/ribbon_styles.dart";

class RibbonApplicationMenuDropdownButton extends StatelessWidget {
  const RibbonApplicationMenuDropdownButton({
    required this.icon,
    required this.items,
    Key? key,
    this.label = "",
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Function()? onPressed;
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
        style: kApplicationMenuButtonThemeData,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 4, 12),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 12,
              ),
              Text(label),
              const Spacer(),
              const SizedBox(
                width: 12,
                child: Icon(Icons.arrow_right, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
