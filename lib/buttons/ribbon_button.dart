import "package:flutter/material.dart";
import "package:ribbon_menu/ribbon_styles.dart";

class LargeRibbonButton extends StatelessWidget {
  const LargeRibbonButton({
    required this.label,
    required this.icon,
    Key? key,
    this.onPressed,
    this.isDropDown = false,
  }) : super(key: key);

  final String label;
  final Icon icon;
  final Function()? onPressed;
  final bool isDropDown;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: kBasicButtonStyle,
      onPressed: onPressed ?? () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(label),
            isDropDown ? const Icon(Icons.arrow_drop_down) : Container(),
          ],
        ),
      ),
    );
  }
}

class SmallRibbonButton extends StatelessWidget {
  const SmallRibbonButton({
    required this.label,
    required this.icon,
    Key? key,
    this.onPressed,
    this.isDropDown = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool isDropDown;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: TextButton(
        style: kBasicButtonStyle,
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, size: 15),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
