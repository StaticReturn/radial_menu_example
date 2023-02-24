import 'package:flutter/material.dart';

class InnerCircle extends StatelessWidget {
  const InnerCircle({Key? key, required this.size, required this.color}) : super(key: key);
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      )
    );
  }
}
