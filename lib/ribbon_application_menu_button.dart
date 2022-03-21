import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart';

class RibbonApplicationMenuButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Function()? onEnter;
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
