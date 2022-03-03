import 'package:flutter/material.dart';

/// A single tab of the RibbonMenu.
class RibbonTab extends StatelessWidget {
  final List<Widget> children;

  const RibbonTab({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0), child: Row(children: children));
  }
}
