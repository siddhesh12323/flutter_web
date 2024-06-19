import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HoverItems extends StatelessWidget {
  List<String> itemNames;
  HoverItems({super.key, required this.itemNames});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(itemNames[0]),
              Text(itemNames[1]),
              Text(itemNames[2]),
            ],
          ),
          Column(
            children: [
              Text(itemNames[3]),
              Text(itemNames[4]),
              Text(itemNames[5]),
            ],
          ),
          Column(
            children: [
              Text(itemNames[6]),
              Text(itemNames[7]),
              Text(itemNames[8]),
            ],
          ),
        ],
      )
    );
  }
}