import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_toggle.dart";
import "package:ribbon_menu/buttons/ribbon_menu_tab_button.dart";
import "package:ribbon_menu/ribbon_application_menu_auxiliary_pane_notifier.dart";

class RibbonApplicationMenu extends StatefulWidget {
  const RibbonApplicationMenu({
    required this.closeAction,
    required this.menuItems,
    required this.buttonLabel,
    this.auxiliaryPane,
    Key? key,
  }) : super(key: key);

  final Function() closeAction;
  final List<Widget> menuItems;
  final Widget? auxiliaryPane;
  final String buttonLabel;

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
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RibbonMenuTabButton(
                  text: widget.buttonLabel,
                  isSelected: false,
                  onPressed: () {
                    ApplicationMenuToggle.of(context).closeFunction();
                  },
                  color: const Color.fromARGB(255, 43, 87, 154),
                ),
                const Divider(color: Colors.grey, height: 1, thickness: 1),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 48,
                        child: Column(
                          children: widget.menuItems,
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                        width: 1,
                      ),
                      Flexible(
                        flex: 52,
                        child: auxiliaryPaneNotifier.auxiliaryPane,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
