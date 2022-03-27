import "package:flutter/material.dart";
import "package:ribbon_menu/ribbon_tab_controller.dart";

/// The [RibbonTabView] handles all the tabs in the ribbon menu.
class RibbonTabView extends StatefulWidget {
  const RibbonTabView({
    required this.controller,
    required this.tabs,
    Key? key,
  }) : super(key: key);

  /// ValueNotifier that notifies listeners if the selected tab changes.
  final RibbonTabController controller;
  final List<Widget> tabs;

  @override
  State<RibbonTabView> createState() => _RibbonTabViewState();
}

class _RibbonTabViewState extends State<RibbonTabView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  Widget get _activeWidget {
    return widget.tabs[widget.controller.selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return _activeWidget;
  }
}
