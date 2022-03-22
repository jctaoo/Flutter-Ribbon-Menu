import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ribbon_menu/application_menu_button_interface.dart';
import 'package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart';
import 'package:ribbon_menu/ribbon_menu_tab_button.dart';

class RibbonApplicationMenu extends StatefulWidget {
  final Function() closeAction;
  final List<IApplicationMenuButton> menuItems;
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
  Widget auxiliaryPane = Container();

  @override
  void initState() {
    super.initState();
    auxiliaryPane = widget.auxiliaryPane ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuxiliaryPaneNotifier(auxiliaryPane),
      child: Consumer<AuxiliaryPaneNotifier>(
          builder: (context, auxiliaryPaneNotifier, child) {
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
                        children: widget.menuItems,
                      )),
                  Flexible(
                    flex: 1,
                    child: auxiliaryPaneNotifier.auxiliaryPane,
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
