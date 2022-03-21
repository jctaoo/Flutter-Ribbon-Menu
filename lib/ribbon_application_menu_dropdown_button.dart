import 'package:flutter/material.dart';
import 'package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart';
import 'package:ribbon_menu/ribbon_application_menu_dropdown_item.dart';
import 'package:provider/provider.dart';

class RibbonApplicationMenuDropdownButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Icon icon;
  final Function()? onMouseEnter;
  final List<RibbonApplicationMenuDropdownItem> items;

  const RibbonApplicationMenuDropdownButton(
      {Key? key,
      this.label = "",
      this.onPressed,
      required this.icon,
      this.onMouseEnter,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        Provider.of<AuxiliaryPaneNotifier>(context, listen: false).setAuxiliaryPane(Column(children: items,));
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
