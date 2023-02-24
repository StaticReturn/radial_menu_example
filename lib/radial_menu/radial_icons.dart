import 'dart:math';
import 'package:flutter/material.dart';
import 'package:radial_menu_example/radial_menu/radial_selection.dart';


class RadialIcons extends StatelessWidget {
  const RadialIcons({Key? key, required this.mainMenuSize, required this.centerMenuSize, required this.children}) : super(key: key);
  final double mainMenuSize;
  final double centerMenuSize;
  final List<RadialSelection> children;
  final double iconRadius = 16.0;

  double _calculateXFrom(double radius, double degrees) => (mainMenuSize / 2) + (radius * sin(degrees));
  double _calculateYFrom(double radius, double degrees) => (mainMenuSize / 2) + (radius * cos(degrees));
  double _calculateArcFrom(int numberOfElements) => 2 * pi / numberOfElements;

  @override
  Widget build(BuildContext context) {
    final List<XYIcon> iconList = [];
    final double radius = (mainMenuSize - ((mainMenuSize - centerMenuSize) /2))/1.8;
    final double degreesPerChild = _calculateArcFrom(children.length);

    for (int i = 0; i < children.length; i++) {
      final XYIcon iconData = XYIcon();
      iconData.icon = children[i].icon;
      iconData.x = _calculateXFrom(radius, degreesPerChild * i) - children[i].iconXoffset/2;
      iconData.y = _calculateYFrom(radius, degreesPerChild * i) - children[i].iconYoffset/2;
      iconList.add(iconData);
    }
      
    return SizedBox(
      width: mainMenuSize,
      height: mainMenuSize,
      child: Stack(
        children: [
          for (var iconData in iconList)
            Positioned(
              top: iconData.y,
              left: iconData.x,
              child: iconData.icon
            ),
        ],
      ),
    );
  }
}

class XYIcon {
  Icon icon = const Icon(Icons.stop_circle);
  double x = 0.0;
  double y = 0.0;
}