import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  // final String fontFamily;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;

  const CustomText(this.text, this.fontSize, this.color, this.fontWeight, {this.textDecoration, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          // fontFamily: fontFamily,
          fontWeight: fontWeight,
          decoration: textDecoration ?? TextDecoration.none,
        ));
  }

}