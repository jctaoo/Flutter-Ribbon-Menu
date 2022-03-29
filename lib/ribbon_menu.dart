import "package:flutter/material.dart";

import "package:ribbon_menu/ribbon_tab_controller.dart";

// TODO: Redo as main entry point for library.
class RibbonMenu extends StatelessWidget {
  RibbonMenu({Key? key}) : super(key: key);

  final RibbonTabController controller = RibbonTabController(0);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              }
              return Colors.black;
            }),
          ),
        ),
      ),
      child: Column(),
    );
  }
}
