import 'package:flutter/material.dart';
import 'package:ribbon_menu/ribbon_application_menu.dart';

import 'ribbon_application_menu_button.dart';
import 'ribbon_menu_tab_button.dart';
import 'ribbon_tab_controller.dart';

class RibbonTabBar extends StatefulWidget {
  final List<String> tabTitles;
  final RibbonTabController ribbonTabController;

  const RibbonTabBar(
      {Key? key, required this.tabTitles, required this.ribbonTabController})
      : super(key: key);

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
    RenderBox renderbox = context.findRenderObject() as RenderBox;
    var offset = renderbox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy,
          child: RibbonApplicationMenu(
            closeAction: _toggleApplicationMenuOverlay,
            menuItems: [
              RibbonApplicationMenuButton(
                label: "Open new Window",
                icon: const Icon(Icons.window_outlined),
                onPressed: () {},
              ),
              RibbonApplicationMenuButton(
                label: "Create new window",
                icon: const Icon(Icons.code),
                onPressed: () {},
              ),
            ],
            auxiliaryPane: const Text(
              "Recent files",
              style: TextStyle(fontSize: 12.0),
            ),
          )),
    );
  }

  void _toggleApplicationMenuOverlay() {
    if (!_applicationMenuIsShown) {
      _applicationMenuOverlay = _createApplicationMenuOverlay();
      Overlay.of(context)?.insert(_applicationMenuOverlay!);
      _applicationMenuIsShown = true;
    } else if (_applicationMenuOverlay != null) {
      _applicationMenuOverlay!.remove();
      _applicationMenuIsShown = false;
    }
  }

  List<Widget> _buildTabItems() {
    var list = List<Widget>.generate(widget.tabTitles.length, (index) {
      return RibbonMenuTabButton(
          text: widget.tabTitles[index],
          isFirst: index == 0 ? true : false,
          isSelected:
              index == widget.ribbonTabController.selectedIndex ? true : false,
          onPressed: () => _selectTab(index));
    });

    list[0] = RibbonMenuTabButton(
        text: widget.tabTitles[0],
        isSelected:
            0 == widget.ribbonTabController.selectedIndex ? true : false,
        onPressed: () {
          _toggleApplicationMenuOverlay();
        });

    list.add(Expanded(
      child: Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1)))),
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildTabItems(),
    );
  }
}
