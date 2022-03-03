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
    return DecoratedBox(
      decoration: BoxDecoration(border: buildBorder()),
      child: SizedBox(
        height: 24.0,
        child: TextButton(
          child: Text(
            text,
            style: const TextStyle(fontSize: 11.5),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Border buildBorder() {
    if (isSelected) {
      return Border(
          left: isFirst
              ? BorderSide.none
              : const BorderSide(color: Colors.grey, width: 1),
          top: const BorderSide(color: Colors.grey, width: 1),
          right: const BorderSide(color: Colors.grey, width: 1));
    } else {
      return const Border(bottom: BorderSide(color: Colors.grey, width: 1));
    }
  }
}
