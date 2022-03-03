import 'package:flutter/material.dart';

class RibbonGroup extends StatelessWidget {
  final String groupTitle;
  final List<Widget> children;

  const RibbonGroup(
      {Key? key, required this.groupTitle, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: children,
            ),
          ),
          Center(
            child: Text(groupTitle,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          )
        ],
      ),
      const VerticalDivider(
        color: Colors.grey,
        indent: 4.0,
        endIndent: 4.0,
        thickness: 1,
      )
    ]);
  }
}
