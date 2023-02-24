import 'dart:math';
import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/global_data.dart';
import 'package:radial_menu_example/radial_menu/global_radians.dart';
import 'package:radial_menu_example/radial_menu/page_option.dart';
import 'package:radial_menu_example/radial_menu/radial_menu.dart';
import 'package:radial_menu_example/radial_menu/radial_selection.dart';



typedef SFunction = Function(String a);
typedef BFunction = bool Function();

class NavigationRadial extends StatefulWidget {
  const NavigationRadial({Key? key, required this.pageOptions, required this.onSelection, required this.isDisabled, this.menuDiameter=256.0}) : super(key: key);
  final List<PageOption> pageOptions;
  final SFunction onSelection;
  final BFunction isDisabled;
  final double menuDiameter;

  @override
  State<NavigationRadial> createState() => _NavigationRadialState();
}

class _NavigationRadialState extends State<NavigationRadial>  {
  final ValueNotifier<double> radians = ValueNotifier(0.0);
  late final VoidCallback popUpMenuControllerForward;
  late final VoidCallback popUpMenuControllerReverse;
  late final List<RadialSelection> getPageOptions = _getPageOptions();
  double longPressXPosition = 0.0;
  double longPressYPosition = 0.0;

  @override
  Widget build(BuildContext context) {    
    return Stack(
      children: [
        GestureDetector(
          onLongPressStart: (details) {
            if (widget.isDisabled())    return;

            setState(() {
              longPressXPosition = details.localPosition.dx;
              longPressYPosition = details.localPosition.dy;
              popUpMenuControllerForward();
            });
          },
          onLongPressEnd: (details) {
            if (widget.isDisabled())    return;

            popUpMenuControllerReverse();
          },
          onLongPressMoveUpdate: (details) {
            if (widget.isDisabled())    return;

            radians.value = atan2(details.localPosition.dy - longPressYPosition, details.localPosition.dx - longPressXPosition);
          },
        ),
        Positioned(
          left: longPressXPosition - (widget.menuDiameter /2),
          top: longPressYPosition - (widget.menuDiameter /2),
          child: GlobalRadians(
            radians: radians,
            child: RadialMenu(
              mainMenuSize: widget.menuDiameter,
              pageOptions: getPageOptions,
              forwardCallback: (callback) {popUpMenuControllerForward = callback;},
              reverseCallback: (callback) {popUpMenuControllerReverse = callback;},
              onChangedCallback: (selectedText) {
                if (selectedText.isNotEmpty) {
                  widget.onSelection(selectedText);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  List<RadialSelection> _getPageOptions() {
    List<RadialSelection> pageOptions = [];

    for (var option in widget.pageOptions) {
      var selectionItem = RadialSelection(
        option.name,
        Icon(
          option.iconData, 
          size: (option.size != 0) ? option.size : 32.0, 
          color: GlobalData.of(context).appTheme.radialMenuIcon
        ),
      );

      if (option.xOffset != 0.0)    selectionItem.iconXoffset = option.xOffset;
      if (option.yOffset != 0.0)    selectionItem.iconYoffset = option.yOffset;

      pageOptions.add(selectionItem);
    }

    return pageOptions;
  }
}