import 'dart:math';
import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/global_data.dart';
import 'package:radial_menu_example/radial_menu/global_radians.dart';
import 'package:radial_menu_example/radial_menu/radial_selection.dart';


typedef SFunction = Function(String a);

class SelectionText extends StatefulWidget {
  const SelectionText({Key? key,  required this.size, required this.detectionArc, required this.pages, required this.onChanged}) : super(key: key);
  final double size;
  final double detectionArc;
  final List<RadialSelection> pages;
  final SFunction onChanged;

  @override
  State<SelectionText> createState() => _SelectionTextState();
}

class _SelectionTextState extends State<SelectionText> {
  late final double radiansPerPosition = _getPositionLenghtFrom(widget.pages.length);
  late final double halfDetectionArc = widget.detectionArc/2;
  bool didInitState = false;
  String currentText = '';

  @override
  void didChangeDependencies() {
    if (!didInitState) {
      GlobalRadians.of(context).radians.addListener(() => _update());
      didInitState = true;
    }
    super.didChangeDependencies();
  }
 
  double _getPositionLenghtFrom(int numberOfElements) => 2 * pi / numberOfElements;
  double _getPositionFor(int elementNumber) => elementNumber * radiansPerPosition;  

  _update() {
    final double currentRadianPosition = _getCurrentPosition();
    final String selectedText = _getCurrentlySelectedText(currentRadianPosition);

    if (currentText != selectedText) {
      widget.onChanged(selectedText);
      setState(() {
        currentText = selectedText;
      });
    }
  }

  // Convert our position to the coordinate system we would like to use:
  // The 6 o'clock position is zero and counterclockwise is a positive direction.
  double _getCurrentPosition() {
    final double currentRadianPosition = -(GlobalRadians.of(context).radians.value) + pi/2;

    if (currentRadianPosition < 0) {
      return currentRadianPosition + 2*pi;
    } else {
      return currentRadianPosition;
    }
  }

  String _getCurrentlySelectedText(double currentRadianPosition) {
    final int intersectingElement = _getIntersectingElement(currentRadianPosition);

    if (intersectingElement == -1) {
      return '';
    } else {
      return widget.pages[intersectingElement].name;
    }
  }

  int _getIntersectingElement(double currentRadianPosition) {
    if (currentRadianPosition <= (halfDetectionArc) || 
        currentRadianPosition >= (2*pi - (halfDetectionArc))) {
      return 0;
    } else {
      final int nearestElement = (currentRadianPosition / radiansPerPosition).round();
      final double nearestElementPosition = _getPositionFor(nearestElement);

      if (currentRadianPosition <= (nearestElementPosition + (halfDetectionArc)) && 
          currentRadianPosition >= (nearestElementPosition - (halfDetectionArc))) {
        return nearestElement;
      } else {
        return -1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(currentText, style: GlobalData.of(context).appTheme.commonText)
    );
  }
}