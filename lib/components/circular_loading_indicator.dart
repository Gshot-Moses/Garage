import 'package:flutter/material.dart';


class CircularLoadingIndicator extends StatelessWidget {

  final double width;
  final double height;
  final double strokeWidth;

  const CircularLoadingIndicator({
    this.width = 25,
    this.height = 25,
    this.strokeWidth = 2,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(strokeWidth: strokeWidth)
    );
  }
}
