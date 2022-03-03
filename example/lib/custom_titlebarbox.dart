import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ribbon_menu/ribbon-menu.dart';
import 'package:ribbon_menu/ribbon_tab_controller.dart';

import 'window_buttons.dart';

class CustomWindowTitleBarBox extends StatelessWidget {
  final double titleBarHeight = 148;
  final Widget? child;
  final RibbonTabController controller = RibbonTabController(0);

  CustomWindowTitleBarBox({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container();
    }
    return SizedBox(
        height: titleBarHeight,
        child: DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.white,
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1))),
            child: MoveWindow(
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.folder_outlined,
                            size: 16,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                          child: VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                            width: 0,
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        const Text(
                          "File Explorer",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Expanded(child: MoveWindow()),
                        const WindowButtons()
                      ],
                    ),
                  ),
                  Expanded(child: RibbonMenu()),
                ],
              ),
            )));
  }
}
