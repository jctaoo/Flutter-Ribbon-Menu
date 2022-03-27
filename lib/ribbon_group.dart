import "package:flutter/material.dart";

class RibbonGroup extends StatelessWidget {
  const RibbonGroup({
    required this.groupTitle,
    required this.children,
    Key? key,
  }) : super(key: key);

  final String groupTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        children: [
          Expanded(
            child: Row(
              children: children,
            ),
          ),
          Center(
            child: Text(groupTitle,
                style: const TextStyle(fontSize: 10, color: Colors.grey),),
          )
        ],
      ),
      const VerticalDivider(
        color: Colors.grey,
        indent: 4,
        endIndent: 4,
        thickness: 1,
      )
    ],);
  }
}
