import 'package:flutter/material.dart';

class RibbonApplicationMenuItem extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Icon? icon;

  const RibbonApplicationMenuItem(
      {Key? key, this.label = "", this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(Icons.window),
            SizedBox(
              width: 16.0,
            ),
            Text(label),
          ],
        ));
  }
}
