import 'package:flutter/material.dart';

class RibbonMenuTabButton extends StatelessWidget {
  final bool isSelected;
  final bool isFirst;
  final String text;
  final Function() onPressed;

  const RibbonMenuTabButton(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onPressed,
      this.isFirst = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
          border: buildBorder(),
          color: isSelected ? Colors.white : Colors.transparent),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12, color: isSelected ? Colors.black : Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Border buildBorder() {
    if (isSelected) {
      return Border(
          left: isFirst
              ? const BorderSide(color: Colors.transparent, width: 1)
              : const BorderSide(color: Colors.grey, width: 1),
          top: const BorderSide(color: Colors.grey, width: 1),
          right: const BorderSide(color: Colors.grey, width: 1));
    } else {
      return const Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
          left: BorderSide(color: Colors.transparent, width: 1),
          top: BorderSide(color: Colors.transparent, width: 1),
          right: BorderSide(color: Colors.transparent, width: 1));
    }
  }
}
