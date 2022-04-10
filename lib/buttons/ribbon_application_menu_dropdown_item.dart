import "package:flutter/material.dart";
import "package:ribbon_menu/ribbon_styles.dart";

class RibbonApplicationMenuDropdownItem extends StatelessWidget {
  const RibbonApplicationMenuDropdownItem({
    required this.icon,
    required this.label,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: kApplicationMenuButtonThemeData,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 4, 12),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
