import 'package:flutter/material.dart';
import 'package:flutter_application_web/widgets/product_text_widget.dart';
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
  final ScrollController _scrollController = ScrollController();
  final double _scrollAmount = 450.0; // Adjust this value to scroll by a different amount

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.position.pixels + _scrollAmount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                      padding: const EdgeInsets.all(20),
                      height: 500,
                      color: const Color.fromARGB(255, 255, 193, 132),
                      child: Stack(
                        children: [
                          Center(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/background_full.png"),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Center(
                              child: SelectableText(
                            "We produce high-quality furniture for lifestyle",
                            style: TextStyle(
                                fontFamily: "Klapa",
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                // part 2
                Flexible(
                  child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(20),
                      height: 300,
                      child: LayoutBuilder(builder: (context, constraints) {
                        if (constraints.maxWidth < 500) {
                          // Mobile layout
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 450,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("01",
                                          style: TextStyle(fontSize: 30)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const SelectableText.rich(TextSpan(
                                          text: 'The combination of ',
                                          style: TextStyle(fontSize: 20),
                                          children: [
                                            TextSpan(
                                                text:
                                                    'sophisticated design and unbridled comfort ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    'in our new living room solutions')
                                          ])),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _scrollRight();
                                        },
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("01",
                                      style: TextStyle(fontSize: 25)),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const ProductTextWidget(),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          );
                        }
                      })),
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
                    : const SizedBox();
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
