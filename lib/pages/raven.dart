import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radial_menu_example/data/spacing.dart';
import 'package:radial_menu_example/data/strings_en.dart';


class Raven extends StatelessWidget {
  const Raven({ Key? key }) : super(key: key);
  static const int linesBeforePoem = 4;
  static const int linesAfterPoem = 1;

  @override
  Widget build(BuildContext context) {
    final double scaleRatio = MediaQuery.of(context).size.width / 392;
    final double ravenWidth = MediaQuery.of(context).size.width * 0.8;

    return Container(
      color: Colors.grey.shade100,
      child: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset('assets/images/raven.png', width: ravenWidth)
            ),
          ),
          Positioned.fill(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: verticalScreenPadding),
              itemCount: stringListTheRaven.length + linesBeforePoem + linesAfterPoem, // stringListTheRaven.length is 18
              itemBuilder: (BuildContext context, int index) => _getWidget(index, scaleRatio),
            ),
          )
        ],
      ),
    );
  }
  
  Widget _getWidget(int index, double scaleRatio) {
    final int ravenLineNumber = index - linesBeforePoem;

    switch(index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text('THE RAVEN', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'SpecialElite', fontSize: scaleRatio * 24.0)),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text('by', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'SpecialElite', fontSize: scaleRatio * 18.0)),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text('Edgar Allan Poe', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'SpecialElite', fontSize: scaleRatio * 18.0)),
        );
      case 3:
        return Padding(
          padding: EdgeInsets.only(bottom: scaleRatio *16.0),
          child: Center(
            child: Transform.scale(
              scale: scaleRatio * 0.3,
              child: SvgPicture.asset('assets/images/divider.svg', color: Colors.black),
            ),
          ),
        );
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
        return Container(
          padding: EdgeInsets.only(
            bottom: (index == (stringListTheRaven.length-1+linesBeforePoem))
              ? 0.0
              : 12.0,
          ),
          child: Text(stringListTheRaven[ravenLineNumber], textAlign: TextAlign.center, style: TextStyle(fontSize: scaleRatio * 11.1)),
        );
      case 22:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset('assets/images/double_flourish.svg', color: Colors.black),
            ),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}