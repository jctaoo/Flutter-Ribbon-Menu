import "package:flutter/material.dart";
import "package:ribbon_menu/buttons/ribbon_application_menu_toggle.dart";
import "package:ribbon_menu/buttons/ribbon_menu_tab_button.dart";
import "package:ribbon_menu/ribbon_tab_controller.dart";

class RibbonTabBar extends StatefulWidget {
  const RibbonTabBar({
    required this.tabTitles,
    required this.ribbonTabController,
    this.applicationMenu,
    Key? key,
  }) : super(key: key);

  final List<String> tabTitles;
  final RibbonTabController ribbonTabController;
  final Widget? applicationMenu;

  @override
  State<RibbonTabBar> createState() => _RibbonTabBarState();
}

class _RibbonTabBarState extends State<RibbonTabBar> {
  bool _applicationMenuIsShown = false;
  OverlayEntry? _applicationMenuOverlay;

  @override
  void initState() {
    super.initState();
    widget.ribbonTabController.addListener(() {
      setState(() {});
    });
  }

  void _selectTab(int index) {
    widget.ribbonTabController.selectedIndex = index;
  }

  OverlayEntry _createApplicationMenuOverlay() {
    var renderbox = context.findRenderObject() as RenderBox;
    var offset = renderbox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy,
          child: ApplicationMenuToggle(
            closeFunction: _toggleApplicationMenuOverlay,
            child: widget.applicationMenu!,
          ),),
    );
  }

  void _toggleApplicationMenuOverlay() {
    if (widget.applicationMenu != null) {
      if (!_applicationMenuIsShown) {
        _applicationMenuOverlay = _createApplicationMenuOverlay();
        Overlay.of(context)?.insert(_applicationMenuOverlay!);
        _applicationMenuIsShown = true;
      } else if (_applicationMenuOverlay != null) {
        _applicationMenuOverlay!.remove();
        _applicationMenuIsShown = false;
      }
    }
  }

  List<Widget> _buildTabItems() {
    var newList = List<Widget>.empty(growable: true);

    if (widget.applicationMenu != null) {
      newList.add(RibbonMenuTabButton(
          text: widget.tabTitles[0],
          isSelected: false,
          onPressed: _toggleApplicationMenuOverlay,),);
    }

    for (var i = 1; i < widget.tabTitles.length; i++) {
      newList.add(RibbonMenuTabButton(
          text: widget.tabTitles[i],
          isSelected: widget.ribbonTabController.selectedIndex == i - 1,
          onPressed: () => _selectTab(i - 1),),);
    }

    newList.add(const Expanded(
      child: DecoratedBox(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey)),),),
    ),);

    return newList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildTabItems(),
    );
  }
}
