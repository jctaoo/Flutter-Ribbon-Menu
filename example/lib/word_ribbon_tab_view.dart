import "package:flutter/material.dart";
import "package:ribbon_menu/buttons/ribbon_button.dart";
import "package:ribbon_menu/buttons/ribbon_dropdown_button.dart";
import "package:ribbon_menu/ribbon_group.dart";
import "package:ribbon_menu/ribbon_small_button_column.dart";
import "package:ribbon_menu/ribbon_tab.dart";
import "package:ribbon_menu/ribbon_tab_controller.dart";
import "package:ribbon_menu/ribbon_tab_view.dart";

class WordRibbonTabView extends StatelessWidget {
  const WordRibbonTabView({required this.controller, Key? key})
      : super(key: key);

  final RibbonTabController controller;

  @override
  Widget build(BuildContext context) {
    return RibbonTabView(
      controller: controller,
      tabs: [
        RibbonTab(
          children: [
            const RibbonGroup(
              groupTitle: "First Group",
              children: [
                LargeRibbonButton(label: "Alarm", icon: Icon(Icons.alarm)),
                LargeRibbonButton(label: "Publish", icon: Icon(Icons.publish))
              ],
            ),
            RibbonGroup(
              groupTitle: "Clipboard",
              children: [
                RibbonSmallButtonColumn(
                  children: const [
                    SmallRibbonButton(label: "Cut", icon: Icons.cut),
                    SmallRibbonButton(
                      label: "Copy",
                      icon: Icons.copy,
                    ),
                    SmallRibbonButton(
                        label: "Very long button", icon: Icons.paste)
                  ],
                ),
              ],
            ),
            RibbonGroup(
              groupTitle: "Dropdown Test",
              children: [
                LargeRibbonDropdownButton(
                  icon: Icons.luggage_rounded,
                  label: "Large Button",
                  child: RibbonSmallButtonColumn(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    children: const [
                      SmallRibbonButton(label: "Item 1", icon: Icons.kayaking),
                      SmallRibbonButton(label: "Item 2", icon: Icons.sports)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        const RibbonTab(
          children: [
            SmallRibbonButton(
              label: "Empty Page",
              icon: Icons.pageview_outlined,
            )
          ],
        ),
      ],
    );
  }
}
