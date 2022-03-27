import "package:flutter/material.dart";

/// A single tab of the RibbonMenu.
class RibbonTab extends StatelessWidget {
  const RibbonTab({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2), child: Row(children: children),);
  }
}
