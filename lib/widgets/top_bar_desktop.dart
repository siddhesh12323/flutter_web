// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_web/widgets/hover_items.dart';
import 'package:flutter_application_web/widgets/navigation_bar.dart';

class TopBarDesktop extends StatefulWidget {
  bool isSearchClicked;
  final TextEditingController searchController;
  FocusNode focusNode;
  TopBarDesktop(
      {super.key,
      this.isSearchClicked = false,
      required this.searchController,
      required this.focusNode});

  @override
  State<TopBarDesktop> createState() => _TopBarDesktopState();
}

class _TopBarDesktopState extends State<TopBarDesktop> {
  OverlayEntry? entry;
  final LayerLink layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showOverlay(List<String> itemNames) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
      builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, offset.dy + size.height - 4),
              child: HoverItems(itemNames: itemNames))),
    );
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            const SizedBox(width: 20),
            // const Text("Liberetty", style: TextStyle(fontSize: 25)),
            const Image(
                              image: AssetImage(
                                  "assets/images/logo.png"),
                              width: 100,
                              // fit: BoxFit.fill,
                            ),
            const Spacer(),
            // nav bar items
            NavItem(title: "PRODUCTS", addDropDown: true, showOverlay: showOverlay, hideOverlay: hideOverlay),
            NavItem(
              title: "3D MODELS",
              addDropDown: true,
              showOverlay: showOverlay,
              hideOverlay: hideOverlay,
            ),
            NavItem(title: "GALLERY", addDropDown: false, showOverlay: showOverlay, hideOverlay: hideOverlay),
            NavItem(title: "ABOUT", addDropDown: false, showOverlay: showOverlay, hideOverlay: hideOverlay),
            NavItem(
              title: "CONTACT",
              addDropDown: false,
              showOverlay: showOverlay,
              hideOverlay: hideOverlay,
            ),
            const Spacer(),
            widget.isSearchClicked
                ? Container(
                    width: 200,
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: widget.searchController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        suffixIcon: InkWell(
                            onTap: () {}, child: const Icon(Icons.search)),
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (value) {},
                      onEditingComplete: () {
                        setState(() {
                          widget.isSearchClicked = false;
                        });
                      },
                      focusNode: widget.focusNode,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isSearchClicked = !widget.isSearchClicked;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                    )),
            const SizedBox(width: 10),
            const Text(
              "CART",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(width: 5),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text("1")),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
