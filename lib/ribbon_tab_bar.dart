import 'package:flutter/material.dart';

import 'ribbon_menu_tab_button.dart';
import 'ribbon_tab_controller.dart';

class RibbonTabBar extends StatefulWidget {
  final List<String> tabTitles;
  final RibbonTabController ribbonTabController;

  const RibbonTabBar(
      {Key? key, required this.tabTitles, required this.ribbonTabController})
      : super(key: key);

  @override
  State<RibbonTabBar> createState() => _RibbonTabBarState();
}

class _RibbonTabBarState extends State<RibbonTabBar> {
  @override
  void initState() {
    super.initState();
    widget.ribbonTabController.addListener(() {
      setState(() {});
    });
  }

  void _selectTab(int index) {
    widget.ribbonTabController.selectedIndex = index;
  }

  List<Widget> _buildTabItems() {
    var list = List<Widget>.generate(
        widget.tabTitles.length,
        (index) => RibbonMenuTabButton(
            text: widget.tabTitles[index],
            isFirst: index == 0 ? true : false,
            isSelected: index == widget.ribbonTabController.selectedIndex
                ? true
                : false,
            onPressed: () => _selectTab(index)));

    list.add(Expanded(
      child: Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1)))),
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildTabItems(),
    );
  }
}
