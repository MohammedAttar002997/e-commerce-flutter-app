import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;

  SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.height = 1.2,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        fontFamily: 'Roboto',
        height: height,
        fontSize: size==0?Dimensions.font12:size,
        color: color,
      ),
    );
  }
}
