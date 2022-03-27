import "package:flutter/material.dart";

class LargeRibbonButton extends StatelessWidget {
  const LargeRibbonButton({
    required this.label,
    required this.icon,
    Key? key,
    this.onPressed,
    this.isDropDown = false,
  }) : super(key: key);

  final String label;
  final Icon icon;
  final Function()? onPressed;
  final bool isDropDown;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(label),
            isDropDown ? const Icon(Icons.arrow_drop_down) : Container(),
          ],
        ),
      ),
    );
  }
}

class SmallRibbonButton extends StatelessWidget {
  const SmallRibbonButton({
    required this.label,
    required this.icon,
    Key? key,
    this.onPressed,
    this.isDropDown = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool isDropDown;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, size: 15),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

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
          child: widget.child,),
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
            icon: Icon(widget.icon),),
      ],
    );
  }
}
