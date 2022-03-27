import "package:flutter/material.dart";

class RibbonSmallButtonColumn extends StatelessWidget {
  const RibbonSmallButtonColumn({
    required this.children,
    this.decoration,
    Key? key,
  })  : assert(children.length <= 3),
        assert(children.length > 0),
        super(key: key);

  final List<Widget> children;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: DecoratedBox(
        decoration: decoration ?? const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
