import 'package:flutter/material.dart';

class LargeRibbonButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function()? onPressed;
  final bool isDropDown;

  const LargeRibbonButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.isDropDown = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon,
          Text(label),
          isDropDown ? const Icon(Icons.arrow_drop_down) : Container(),
        ]),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}

class SmallRibbonButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isDropDown;
  final Function()? onPressed;

  const SmallRibbonButton(
      {Key? key,
      required this.label,
      required this.icon,
      this.onPressed,
      this.isDropDown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 15),
            const SizedBox(width: 4.0),
            Text(label, style: const TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}

/// [LargeRibbonDropdownButton] represents a [LargeRibbonButton] with with dropdown function.
class LargeRibbonDropdownButton extends StatefulWidget {
  final Widget child;
  final String label;
  final IconData icon;

  const LargeRibbonDropdownButton({
    Key? key,
    required this.child,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  State<LargeRibbonDropdownButton> createState() =>
      _LargeRibbonDropdownButtonState();
}

class _LargeRibbonDropdownButtonState extends State<LargeRibbonDropdownButton> {
  OverlayEntry? _overlayEntry;
  bool isShown = false;

  OverlayEntry _createOverlay() {
    RenderBox renderbox = context.findRenderObject() as RenderBox;
    var size = renderbox.size;
    var offset = renderbox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height,
          width: size.width,
          child: widget.child),
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
            icon: Icon(widget.icon)),
        const Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
