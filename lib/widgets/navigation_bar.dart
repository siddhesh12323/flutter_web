import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final String title;
  final bool addDropDown;
  final void Function(String) showOverlay;
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
        widget.showOverlay(widget.title);
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
