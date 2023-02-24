import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radial_menu_example/data/app_theme.dart';
import 'package:radial_menu_example/data/global_data.dart';
import 'package:radial_menu_example/pages/home_page.dart';
import 'package:radial_menu_example/data/planet_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    _initializeApp();

    return MaterialApp(
      title: 'Radial Menu Example',
      debugShowCheckedModeBanner: false,
      home: GlobalData(
        appTheme: appTheme,
        planetData: _getPlanetData(),
        child: const HomePage(),
      ),
    );
  }

  _initializeApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom
      ]
    );
  }

  List<PlanetData> _getPlanetData() {
    List<PlanetData> list = [];

    PlanetData planetData = PlanetData();
    planetData.name = 'Sol';
    planetData.uri = 'assets/images/sun.png';
    planetData.circumferance = '4.3 × 10⁶  km';
    planetData.mass = '1.9 × 10³⁰  kg';
    planetData.distance = '8min  19s';
    planetData.gravity = '274  m/s²';
    planetData.topPosition = -8.0;
    planetData.leftPosition = -15.0;
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Mercury';
    planetData.uri = 'assets/images/mercury.png';
    planetData.circumferance = '15,329  km';
    planetData.mass = '3.3 × 10²³  kg';
    planetData.distance = '4min  18s';
    planetData.gravity = '3.7  m/s²';
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Venus';
    planetData.uri = 'assets/images/venus.png';
    planetData.circumferance = '38,025  km';
    planetData.mass = '4.8 × 10²⁴  kg';
    planetData.distance = '2min  8s';
    planetData.gravity = '8.87  m/s²';
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Earth';
    planetData.uri = 'assets/images/earth.png';
    planetData.circumferance = '40,075 km';
    planetData.mass = '5.9 × 10²⁴  kg';
    planetData.distance = '0';
    planetData.gravity = '9.8  m/s²';
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Mars';
    planetData.uri = 'assets/images/mars.png';
    planetData.circumferance = '21,344 km';
    planetData.mass = '6.4 × 10²³ kg';
    planetData.distance = '3min  3s';
    planetData.gravity = '3.72  m/s²';
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Jupiter';
    planetData.uri = 'assets/images/jupiter.png';
    planetData.circumferance = '439,264 km';
    planetData.mass = '1.8 × 10²⁷ kg';
    planetData.distance = '32min  40s';
    planetData.gravity = '24.79  m/s²';
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Saturn';
    planetData.uri = 'assets/images/saturn.png';
    planetData.circumferance = '378,675 km';
    planetData.mass = '5.6 × 10²⁶ kg';
    planetData.distance = '41min  28s';
    planetData.gravity = '10.44  m/s²';
    planetData.leftPosition = -78.0;
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Uranus';
    planetData.uri = 'assets/images/uranus.png';
    planetData.circumferance = '160,590 km';
    planetData.mass = '8.6 × 10²⁵ kg';
    planetData.distance = '1h  14min  32s';
    planetData.gravity = '8.69  m/s²';
    planetData.topPosition = -34.0;
    list.add(planetData);

    planetData = PlanetData();
    planetData.name = 'Neptune';
    planetData.uri = 'assets/images/neptune.png';
    planetData.circumferance = '155,600 km';
    planetData.mass = '1.024 × 10²⁶ kg';
    planetData.distance = '3h  69min  3s';
    planetData.gravity = '11.15  m/s²';
    list.add(planetData);

    return list;
  }  
}