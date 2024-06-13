import 'package:flutter/material.dart';
import 'package:flutter_application_web/widgets/top_bar_desktop.dart';

import 'widgets/mobile_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSearchClicked = false;
  TextEditingController searchController = TextEditingController();
  // ignore: prefer_final_fields
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Add listener to the focus node
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // The TextField lost focus
        setState(() {
          isSearchClicked = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the widget is disposed
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Responsive.isMobile(context) ? AppDrawer() : null,
        appBar: Responsive.isMobile(context)
            ? AppBar(
                backgroundColor: Colors.white,
                title: const Text("Liberetty", style: TextStyle(fontSize: 25)),
                actions: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isSearchClicked = !isSearchClicked;
                            });
                          },
                          icon: const Icon(
                            Icons.search,
                          )),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              )
            : null,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // part 1
                Flexible(
                  flex: 2,
                  // fit: FlexFit.tight,
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 500,
                      color: const Color.fromARGB(255, 255, 193, 132),
                      child: const Center(
                          child: SelectableText(
                        "We produce high-quality furniture for lifestyle",
                        style: TextStyle(
                            fontFamily: "Klapa",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                      color: Colors.black,
                      height: 300,
                      child: const Center(
                        child: Text(
                          "Our Products",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                Flexible(
                  child: Container(
                    color: Colors.blue,
                    height: 300,
                  ),
                )
              ],
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 850) {
                return isSearchClicked
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            margin: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: TextField(
                                  controller: searchController,
                                  focusNode: _focusNode,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    hintText: "Search",
                                    border: InputBorder.none,
                                  )),
                            ),
                          ),
                        ],
                      )
                    : SizedBox();
              } else if (constraints.maxWidth < 1200) {
                return TopBarDesktop(
                  isSearchClicked: isSearchClicked,
                  searchController: searchController,
                  focusNode: _focusNode,
                );
              } else {
                return TopBarDesktop(
                  isSearchClicked: isSearchClicked,
                  searchController: searchController,
                  focusNode: _focusNode,
                );
              }
            },
          ),
        ]));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // point 1
    path.lineTo(0, size.height * 0.8);
    // point 2
    path.lineTo(size.width * 0.25, size.height);
    // point 3
    path.lineTo(size.width * 0.75, size.height * 0.8);
    // point 4
    path.lineTo(size.width, size.height);
    // close the path
    path.lineTo(size.width, 0);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;
}
