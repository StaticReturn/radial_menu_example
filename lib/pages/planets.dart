import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/global_data.dart';
import 'package:radial_menu_example/data/spacing.dart';
import 'package:radial_menu_example/widgets/planet_card.dart';


class Planets extends StatelessWidget {
  const Planets({ Key? key }) : super(key: key);
  static const double cardSpacing = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E3963),
      appBar: AppBar(
        elevation: 2.0,
        title: const Text('Our Solar System'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ 
                Color(0xFF3384FC),
                Color(0xFF00C6FF),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: verticalScreenPadding,
          bottom: verticalScreenPadding,
          left: horizontalScreenpadding,
          right: horizontalScreenpadding * 1.5,
        ),
        children: [
          for (var planet in GlobalData.of(context).planetData)
            Padding(
              padding: EdgeInsets.only(
                bottom: (planet == GlobalData.of(context).planetData.last)
                  ? 0.0
                  : 18.0,
              ),
              child: PlanetCard(planet),
            )
        ],
      ),
    );
  }
}