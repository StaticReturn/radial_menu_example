import 'dart:math';

import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/strings_en.dart';


class Moon extends StatelessWidget {
  const Moon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaleRatio = MediaQuery.of(context).size.width / 392;

    return Stack(
      children: [
        SizedBox(
          height: double.maxFinite,
          child: Image.asset('assets/images/moon.png', key: const Key('moon'), fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(scaleRatio * 24.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for(var line in shakespearemoon)
                        Text(
                          line, 
                          style: TextStyle(
                            fontFamily: 'BreeSerif',
                            fontSize: scaleRatio * 18.0,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(scaleRatio * 1.0, scaleRatio * 1.0),
                                blurRadius: 2.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: scaleRatio * -20.0,
                  right: scaleRatio * 27.0,
                  child: Text('- William Shakespeare', style: TextStyle(fontSize:  scaleRatio * 12.0, color: Colors.white))
                ),
                Positioned(
                  top:  scaleRatio * -20.0,
                  left:  scaleRatio * -25.0,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Text('”', style: TextStyle(fontFamily: 'Perpetua', fontSize:  scaleRatio * 96.0, color: Colors.white)),
                  ),
                ),
                Positioned(
                  bottom:  scaleRatio * -95.0,
                  right:  scaleRatio * -25.0,
                  child: Text('”', style: TextStyle(fontFamily: 'Perpetua', fontSize:  scaleRatio * 96.0, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}