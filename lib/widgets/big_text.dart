import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_clean_code/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow textOverflow;

  BigText({
    super.key,
    this.color = const Color(0xFF332d2d),
    required this.text,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size == 0 ? Dimensions.font20 : size,
        color: color,
      ),
    );
  }
}
