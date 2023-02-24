import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/app_theme.dart';
import 'package:radial_menu_example/data/planet_data.dart';



class GlobalData extends InheritedWidget {
  const GlobalData({Key? key, required this.appTheme, required this.planetData, required Widget child}) : super(key: key, child: child);

  final AppTheme appTheme;
  final List<PlanetData> planetData;

  static GlobalData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalData>()!;
  }

  @override
  bool updateShouldNotify(GlobalData oldWidget) { 
    return appTheme != oldWidget.appTheme; 
  }
}