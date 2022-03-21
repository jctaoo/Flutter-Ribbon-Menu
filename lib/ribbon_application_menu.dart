import 'package:flutter/material.dart';
import 'package:ribbon_menu/ribbon_application_menu_button.dart';
import 'package:ribbon_menu/ribbon_menu_tab_button.dart';

import 'ribbon_application_menu_dropdown_button.dart';

class RibbonApplicationMenu extends StatefulWidget {
  final Function() closeAction;
  final List<RibbonApplicationMenuButton> menuItems;
  final Widget? auxiliaryPane;

  const RibbonApplicationMenu(
      {Key? key,
      required this.closeAction,
      required this.menuItems,
      this.auxiliaryPane})
      : super(key: key);

  @override
  State<RibbonApplicationMenu> createState() => _RibbonApplicationMenuState();
}

class _RibbonApplicationMenuState extends State<RibbonApplicationMenu> {
  Widget? auxiliaryPane;
  List<Widget> menuItems = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    auxiliaryPane = widget.auxiliaryPane;

    for (var item in widget.menuItems) {
      menuItems.add(RibbonApplicationMenuDropdownButton(
          icon: item.icon,
          label: item.label,
          items: const [],
          onPressed: item.onPressed,
          onMouseEnter: () {
            setState(() {
              auxiliaryPane = Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0))
                  ]),
                  height: 100,
                  width: 100,
                  child: const Text("Container"));
            });
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RibbonMenuTabButton(
            text: "File",
            isSelected: false,
            onPressed: widget.closeAction,
            color: const Color.fromARGB(255, 43, 87, 154),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: menuItems,
                  )),
              Flexible(
                flex: 1,
                child: auxiliaryPane ?? Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
