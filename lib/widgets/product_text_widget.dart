import 'package:flutter/material.dart';

class ProductTextWidget extends StatelessWidget {
  const ProductTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            color: Colors.grey,
            height: 2,
          ),
          const Spacer(),
          const SelectableText.rich(
              TextSpan(text: 'The combination of ', children: [
            TextSpan(
                text: 'sophisticated design and unbridled comfort ',
                style: TextStyle(fontFamily: 'Mona-Sans-Black')),
            TextSpan(text: 'in our new living room solutions', style: TextStyle(fontFamily: 'Mona-Sans-Medium'))
          ], style: TextStyle(fontFamily: 'Mona-Sans-Medium'))),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
