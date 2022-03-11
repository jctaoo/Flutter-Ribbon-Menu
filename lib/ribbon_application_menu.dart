import 'package:flutter/material.dart';
import 'package:ribbon_menu/ribbon_application_menu_item.dart';
import 'package:ribbon_menu/ribbon_menu_tab_button.dart';

class RibbonApplicationMenu extends StatelessWidget {
  Function() closeAction;

  RibbonApplicationMenu({Key? key, required this.closeAction})
      : super(key: key);

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
            onPressed: closeAction,
            color: Color.fromARGB(255, 43, 87, 154),
          ),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      RibbonApplicationMenuItem(
                        label: "Create new Window",
                        onPressed: () {},
                      )
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    height: 300,
                    color: Colors.grey,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
