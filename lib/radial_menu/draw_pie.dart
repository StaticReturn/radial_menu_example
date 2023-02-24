import 'package:flutter/material.dart';
import 'package:radial_menu_example/radial_menu/global_radians.dart';


class DrawPie extends StatefulWidget {
  const DrawPie({Key? key, required this.radius, required this.arc, required this.arcColor}) : super(key: key);
  final double radius;
  final double arc;
  final Color arcColor;

  @override
  State<DrawPie> createState() => _DrawPieState();
}

class _DrawPieState extends State<DrawPie> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.radius, widget.radius),
      willChange: true,
      painter: DrawPieSlice(
        radius: widget.radius,
        arc: widget.arc,
        arcColor: widget.arcColor,
        radianNotifier: GlobalRadians.of(context).radians
      ),
    );
  }
}


class DrawPieSlice extends CustomPainter {
  DrawPieSlice({required this.radius, required this.arc, required this.arcColor, required this.radianNotifier}) : super(repaint: radianNotifier) {
    drawArcRect = Rect.fromCircle(center: Offset(radius/2, radius/2), radius: radius);
  }
  final double radius;
  final double arc;
  final Color arcColor;
  final ValueNotifier<double> radianNotifier;
  final Paint paintObject = Paint();
  late final Rect drawArcRect;
  late final double halfArc = arc/2;

  @override
  void paint(Canvas canvas, Size size) {
    final paintObject = Paint();

    paintObject.color = arcColor;
    paintObject.style = PaintingStyle.fill;

    canvas.drawArc(drawArcRect, radianNotifier.value - halfArc, arc, true, paintObject);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}