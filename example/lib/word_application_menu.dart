import 'package:flutter/material.dart';
import 'package:ribbon_menu/ribbon_application_menu.dart';
import 'package:ribbon_menu/ribbon_application_menu_button.dart';
import 'package:ribbon_menu/ribbon_application_menu_dropdown_button.dart';
import 'package:ribbon_menu/ribbon_application_menu_dropdown_item.dart';

class WordApplicationMenu extends StatelessWidget {
  const WordApplicationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RibbonApplicationMenu(closeAction: () {}, menuItems: [
      const RibbonApplicationMenuDropdownButton(
          icon: Icon(Icons.window),
          label: "Open new window",
          items: [
            RibbonApplicationMenuDropdownItem(
                icon: Icon(Icons.window_outlined), label: "Open new Terminal"),
            RibbonApplicationMenuDropdownItem(
                icon: Icon(Icons.window_outlined),
                label: "Open new Terminal in Process"),
          ]),
      RibbonApplicationMenuButton(
        icon: const Icon(Icons.add_a_photo_sharp),
        label: "Change folder",
        onPressed: () {},
      )
    ]);
  }
}
