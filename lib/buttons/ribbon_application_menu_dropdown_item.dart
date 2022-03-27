import "package:flutter/material.dart";

class RibbonApplicationMenuDropdownItem extends StatelessWidget {
  const RibbonApplicationMenuDropdownItem(
      {required this.icon, required this.label, Key? key, this.onPressed,})
      : super(key: key);

  final Function()? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
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
        ),);
  }
}
