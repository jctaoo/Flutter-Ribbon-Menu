import "package:flutter/material.dart";
import "package:ribbon_menu/ribbon_styles.dart";

class RibbonMenuTabButton extends StatelessWidget {
  const RibbonMenuTabButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
    this.color = Colors.transparent,
    this.isFirst = false,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final bool isFirst;
  final String text;
  final Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        border: buildBorder(),
        color: isSelected ? Colors.white : color,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: kBasicButtonStyle,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Border buildBorder() {
    if (isSelected) {
      return Border(
        left: isFirst
            ? const BorderSide(color: Colors.transparent)
            : const BorderSide(color: Colors.grey),
        top: const BorderSide(color: Colors.grey),
        right: const BorderSide(color: Colors.grey),
      );
    } else {
      return const Border(
        bottom: BorderSide(color: Colors.grey),
        left: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
      );
    }
  }
}
