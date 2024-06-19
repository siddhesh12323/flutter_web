import 'package:flutter/material.dart';

class ProductTextWidgetMobile extends StatelessWidget {
  const ProductTextWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 450,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("01", style: TextStyle(fontSize: 30)),
          SizedBox(
            height: 20,
          ),
          SelectableText.rich(TextSpan(
              text: 'The combination of ',
              children: [
                TextSpan(
                    text: 'sophisticated design and unbridled comfort ',
                    style: TextStyle(fontFamily: 'Mona-Sans-Black')),
                TextSpan(
                    text: 'in our new living room solutions',
                    style: TextStyle(fontFamily: 'Mona-Sans-Medium'))
              ],
              style: TextStyle(fontFamily: 'Mona-Sans-Medium'))),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
