// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  Color? textColor;
  Color? backgroundColor;
  String? productName;
  String? productImage;
  ProductCard(
      {super.key,
      required this.textColor,
      required this.backgroundColor,
      required this.productName,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 350,
      height: 300,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: 400,
              height: 190,
              color: backgroundColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage(productImage!),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SelectableText(
                productName!,
                style: TextStyle(
                  fontFamily: 'Mona-Sans-Bold',
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
