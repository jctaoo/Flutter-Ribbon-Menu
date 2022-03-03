import 'package:flutter/material.dart';

class RibbonSmallButtonColumn extends StatelessWidget {
  final List<Widget> children;
  final BoxDecoration? decoration;

  const RibbonSmallButtonColumn(
      {Key? key, required this.children, this.decoration})
      : assert(children.length <= 3),
        assert(children.length > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
