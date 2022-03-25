import 'ribbon_tab_view.dart';
import 'ribbon_tab.dart';
import 'buttons/ribbon_button.dart';
import 'ribbon_group.dart';
import 'ribbon_small_button_column.dart';
import 'ribbon_tab_controller.dart';
import 'package:flutter/material.dart';

class RibbonMenu extends StatelessWidget {
  final RibbonTabController controller = RibbonTabController(0);

  RibbonMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return Colors.black;
      })))),
      child: Column(
        children: [
          Expanded(
            child: RibbonTabView(
              controller: controller,
              tabs: [
                RibbonTab(children: [
                  const RibbonGroup(
                    groupTitle: "First Group",
                    children: [
                      LargeRibbonButton(
                          label: "Alarm", icon: Icon(Icons.alarm)),
                      LargeRibbonButton(
                          label: "Publish", icon: Icon(Icons.publish))
                    ],
                  ),
                  RibbonGroup(groupTitle: "Clipboard", children: [
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
                  ]),
                  RibbonGroup(groupTitle: "Dropdown Test", children: [
                    LargeRibbonDropdownButton(
                        icon: Icons.luggage_rounded,
                        label: "Large Button",
                        child: RibbonSmallButtonColumn(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          children: const [
                            SmallRibbonButton(
                                label: "Item 1", icon: Icons.kayaking),
                            SmallRibbonButton(
                                label: "Item 2", icon: Icons.sports)
                          ],
                        )),
                  ])
                ]),
                const RibbonTab(children: [
                  SmallRibbonButton(
                    label: "Empty Page",
                    icon: Icons.pageview_outlined,
                  )
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
