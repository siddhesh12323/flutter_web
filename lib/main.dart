// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'widgets/mobile_drawer.dart';
import 'widgets/product_card.dart';
import 'widgets/product_text_widget.dart';
import 'widgets/product_text_widget_mobile.dart';
import 'widgets/top_bar_desktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Liberetty',
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
  FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final double _scrollAmount = 450.0;

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
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Responsive.isMobile(context) ? const AppDrawer() : null,
        appBar: Responsive.isMobile(context)
            ? AppBar(
                backgroundColor: Colors.white,
                title:
                    const Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 100,
                  // fit: BoxFit.fill,
                ),
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
                      margin: const EdgeInsets.only(top: 40),
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
                                // ignore: sized_box_for_whitespace
                                Container(
                                  width: 450,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ProductTextWidgetMobile(),
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
                                ProductCard(
                                  textColor:
                                      const Color.fromARGB(255, 231, 201, 102),
                                  backgroundColor:
                                      const Color.fromARGB(255, 245, 209, 183),
                                  productName: "Rotterdam Dining Room Chair",
                                  productImage: "assets/images/rotterdam.png",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ProductCard(
                                    textColor: const Color.fromARGB(
                                        255, 106, 153, 127),
                                    backgroundColor: const Color.fromARGB(
                                        255, 228, 228, 228),
                                    productName: "Lomax Chair",
                                    productImage: "assets/images/lomax.png"),
                                const SizedBox(
                                  width: 20,
                                ),
                                ProductCard(
                                    textColor: const Color.fromARGB(
                                        255, 193, 151, 140),
                                    backgroundColor: const Color.fromARGB(
                                        255, 179, 177, 191),
                                    productName: "Lomax Chair",
                                    productImage: "assets/images/birstol.png"),
                                const SizedBox(
                                  width: 20,
                                ),
                                ProductCard(
                                    textColor:
                                        const Color.fromARGB(255, 193, 82, 55),
                                    backgroundColor: const Color.fromARGB(
                                        255, 215, 167, 125),
                                    productName: "Globus Chair",
                                    productImage: "assets/images/globus.png"),
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
                                ProductCard(
                                  textColor:
                                      const Color.fromARGB(255, 231, 201, 102),
                                  backgroundColor:
                                      const Color.fromARGB(255, 245, 209, 183),
                                  productName: "Rotterdam Dining Room Chair",
                                  productImage: "assets/images/rotterdam.png",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ProductCard(
                                    textColor: const Color.fromARGB(
                                        255, 106, 153, 127),
                                    backgroundColor: const Color.fromARGB(
                                        255, 228, 228, 228),
                                    productName: "Lomax Chair",
                                    productImage: "assets/images/lomax.png"),
                                const SizedBox(
                                  width: 20,
                                ),
                                ProductCard(
                                    textColor: const Color.fromARGB(
                                        255, 193, 151, 140),
                                    backgroundColor: const Color.fromARGB(
                                        255, 179, 177, 191),
                                    productName: "Lomax Chair",
                                    productImage: "assets/images/birstol.png"),
                                const SizedBox(
                                  width: 20,
                                ),
                                ProductCard(
                                    textColor:
                                        const Color.fromARGB(255, 193, 82, 55),
                                    backgroundColor: const Color.fromARGB(
                                        255, 215, 167, 125),
                                    productName: "Globus Chair",
                                    productImage: "assets/images/globus.png"),
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
                    child: const Center(
                      child: Text("REMAINING CONTENT GOES HERE"),
                    ),
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
