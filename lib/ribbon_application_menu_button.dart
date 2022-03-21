import 'package:flutter/material.dart';

class RibbonApplicationMenuButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Icon icon;

  const RibbonApplicationMenuButton({
    Key? key,
    this.label = "",
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        // TODO: Set state of RibbonApplicationMenu to show auxiliary pane.
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
