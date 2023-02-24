import 'package:flutter/material.dart';



class OuterCircle extends StatelessWidget {
  const OuterCircle({Key? key, required this.size, required this.fillColor, required this.borderColor}) : super(key: key);
  final double size;
  final Color fillColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: fillColor,
        shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 2.5,
          )
      ),
    );
  }
}
