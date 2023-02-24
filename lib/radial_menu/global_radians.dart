import 'package:flutter/material.dart';

class GlobalRadians extends InheritedWidget {
  const GlobalRadians({Key? key, required this.radians, required Widget child}) : super(key: key, child: child);

  final ValueNotifier<double> radians;

  static GlobalRadians of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalRadians>()!;
  }

  @override
  bool updateShouldNotify(GlobalRadians oldWidget) { 
    return radians != oldWidget.radians; 
  }
}