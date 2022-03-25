import 'package:flutter/material.dart';

class RibbonApplicationMenuDropdownItem extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  final String label;

  const RibbonApplicationMenuDropdownItem(
      {Key? key, this.onPressed, required this.icon, required this.label})
      : super(key: key);

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
                width: 16.0,
              ),
              Text(label),
            ],
          ),
        ));
  }
}
