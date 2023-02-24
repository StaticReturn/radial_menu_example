import 'dart:math';
import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/global_data.dart';
import 'package:radial_menu_example/radial_menu/draw_pie.dart';
import 'package:radial_menu_example/radial_menu/global_radians.dart';
import 'package:radial_menu_example/radial_menu/inner_circle.dart';
import 'package:radial_menu_example/radial_menu/outer_circle.dart';
import 'package:radial_menu_example/radial_menu/radial_icons.dart';
import 'package:radial_menu_example/radial_menu/radial_selection.dart';
import 'package:radial_menu_example/radial_menu/selection_text.dart';



typedef VVFunction = Function(VoidCallback a);
typedef SFunction = Function(String a);

class RadialMenu extends StatefulWidget {
  const RadialMenu({Key? key,  required this.mainMenuSize, required this.pageOptions, required this.forwardCallback, required this.reverseCallback, required this.onChangedCallback}) : super(key: key);
  final double mainMenuSize;
  final List<RadialSelection> pageOptions;
  final VVFunction forwardCallback;
  final VVFunction reverseCallback;
  final SFunction onChangedCallback;

  @override
  State<RadialMenu> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
  late final Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
  late final double centerMenuSize;
  late final double arc;
  late VoidCallback firstMoveCallback;
  String currentValue = '';
  bool didInitState = false;
  bool showDrawPieWidget = false;
  
  @override
  void initState() {
    super.initState();

    centerMenuSize = widget.mainMenuSize * 0.30;
    arc = _calculateArcFrom(widget.pageOptions.length);
    widget.forwardCallback(_forward);
    widget.reverseCallback(_reverse);
  }

  @override
  void didChangeDependencies() {
    if (!didInitState) {
      didInitState = true;
      firstMoveCallback = _firstMoveOfRadialMenu;
      GlobalRadians.of(context).radians.addListener(firstMoveCallback);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _forward() {
    controller.forward();
  }

  _reverse() {
    controller.value = 0.0;
    widget.onChangedCallback(currentValue);
  }

  // Necessary, otherwise on longPress before any movement the Pie will be drawn.
  _firstMoveOfRadialMenu() {
    GlobalRadians.of(context).radians.removeListener(firstMoveCallback);
    showDrawPieWidget = true;
    setState(() {});
  }

  double _calculateArcFrom(int numberOfElements) {
    final double arcSizeForXElements = 2 * pi / numberOfElements;
    return arcSizeForXElements * 2 / 3;
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          OuterCircle(
            size: widget.mainMenuSize,
            fillColor: GlobalData.of(context).appTheme.radialMenuBackground,
            borderColor: GlobalData.of(context).appTheme.radialMenuBorder,
          ),
          if (showDrawPieWidget)
            DrawPie(
              radius: widget.mainMenuSize /2, 
              arc: arc,
              arcColor: GlobalData.of(context).appTheme.radialMenuArc,
            ),
          RadialIcons(
            mainMenuSize: widget.mainMenuSize,
            centerMenuSize: centerMenuSize,
            children: widget.pageOptions
          ),
          InnerCircle(
            size: centerMenuSize,
            color: GlobalData.of(context).appTheme.radialMenuCenter,
          ),
          SelectionText(
            size: centerMenuSize,
            detectionArc: arc,
            pages: widget.pageOptions,
            onChanged: (value) {currentValue = value;},
          ),
        ],
      ),
    );
  }
}