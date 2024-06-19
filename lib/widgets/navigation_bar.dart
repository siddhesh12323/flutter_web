import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final String title;
  final bool addDropDown;
  final void Function(List<String>) showOverlay;
  final void Function() hideOverlay;
  const NavItem(
      {super.key,
      required this.title,
      this.addDropDown = false,
      required this.showOverlay,
      required this.hideOverlay});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        // widget.showOverlay(widget.title);
        switch (widget.title) {
          case "PRODUCTS":
            widget.showOverlay(["Product 1", "Product 2", "Product 3", "Product 4", "Product 5", "Product 6", "Product 7", "Product 8", "Product 9"]);
            break;
          case "3D MODELS":
            widget.showOverlay(["3D Model 1", "3D Model 2", "3D Model 3", "3D Model 4", "3D Model 5", "3D Model 6", "3D Model 7", "3D Model 8", "3D Model 9"]);
            break;
          default:
        }
      },
      onExit: (_) {
        widget.hideOverlay();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 3),
            widget.addDropDown
                ? const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.black,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
