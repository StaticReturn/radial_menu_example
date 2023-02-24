import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/custom_icons.dart';
import 'package:radial_menu_example/data/planet_data.dart';


class PlanetCard extends StatelessWidget {
  const PlanetCard(this.planet, {Key? key }) : super(key: key);
  final PlanetData planet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50.5),
          padding: const EdgeInsets.only(top: 6.0, bottom: 18.0, left: 70.0, right: 30.0),
          decoration: BoxDecoration(
            color: const Color(0xFF434273),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(planet.name, style: const TextStyle(fontSize: 48.0, color: Colors.white)),
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconValue(
                      iconData: CustomIcons.circleNotch,
                      value: planet.circumferance,
                      rightPadding: 3.0,
                    ),
                    IconValue(
                      iconData: CustomIcons.weightHanging,
                      value: planet.mass,
                      rightPadding: 3.0,
                  ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconValue(
                    iconData: CustomIcons.lightbulb,
                    value: planet.distance,
                    rightPadding: 3.0,
                  ),
                  IconValue(
                    iconData: CustomIcons.fallDown,
                    value: planet.gravity,
                    rightPadding: 0.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: planet.topPosition,
          left: planet.leftPosition,
          child: Image.asset(planet.uri, scale: 1.5),
        ),
      ],
    );
  }
}

class IconValue extends StatelessWidget {
  const IconValue({ required this.iconData, required this.value, this.rightPadding = 2.0, Key? key }) : super(key: key);
  final IconData iconData;
  final String value;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(right: rightPadding),
          child: Icon(iconData, color: const Color(0xFF7A6FA3), size: 14.0),
        ),
        Text(value, style: const TextStyle(fontSize: 12.0, color: Color(0xFFB6B2DF))),
      ],      
    );
  }
}