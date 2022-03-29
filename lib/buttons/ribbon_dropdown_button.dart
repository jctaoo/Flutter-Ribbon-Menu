import "package:flutter/material.dart";
import "package:ribbon_menu/buttons/ribbon_button.dart";

/// [LargeRibbonDropdownButton] represents a [LargeRibbonButton] with with
/// dropdown function.
class LargeRibbonDropdownButton extends StatefulWidget {
  const LargeRibbonDropdownButton({
    required this.child,
    required this.label,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String label;
  final IconData icon;

  @override
  State<LargeRibbonDropdownButton> createState() =>
      _LargeRibbonDropdownButtonState();
}

class _LargeRibbonDropdownButtonState extends State<LargeRibbonDropdownButton> {
  OverlayEntry? _overlayEntry;
  bool isShown = false;

  OverlayEntry _createOverlay() {
    var renderbox = context.findRenderObject() as RenderBox;
    var size = renderbox.size;
    var offset = renderbox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: widget.child,
      ),
    );
  }

  void _toggleOverlay() {
    if (!isShown) {
      _overlayEntry = _createOverlay();
      Overlay.of(context)?.insert(_overlayEntry!);
      isShown = true;
    } else if (_overlayEntry != null) {
      _overlayEntry!.remove();
      isShown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LargeRibbonButton(
          isDropDown: true,
          onPressed: _toggleOverlay,
          label: widget.label,
          icon: Icon(widget.icon),
        ),
      ],
    );
  }
}
