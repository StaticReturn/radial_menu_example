import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radial_menu_example/data/custom_icons.dart';
import 'package:radial_menu_example/pages/flower.dart';
import 'package:radial_menu_example/pages/home.dart';
import 'package:radial_menu_example/pages/raven.dart';
import 'package:radial_menu_example/pages/kitten.dart';
import 'package:radial_menu_example/pages/planets.dart';
import 'package:radial_menu_example/pages/moon.dart';
import 'package:radial_menu_example/radial_menu/page_option.dart';
import 'package:radial_menu_example/radial_menu/radial_navigation.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<Widget> currentPage = ValueNotifier<Widget>(const Home());
  late final List<PageOption> pageOptions = _getPageOptions();
  bool didLateInit = false;

  @override
  void didChangeDependencies() {
    if (!didLateInit) {
      _precacheImages();
      didLateInit = true;
    }
    super.didChangeDependencies();
  }

  _precacheImages() {
    precacheImage(Image.asset('assets/images/kitten.gif', key: const Key('kitten')).image, context);
    precacheImage(Image.asset('assets/images/moon.png', key: const Key('moon')).image, context);
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderOutsideViewBoxBuilder, 'assets/images/divider.svg'), context);
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderOutsideViewBoxBuilder, 'assets/images/double_flourish.svg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: currentPage,
            builder: (BuildContext context, Widget newPage, Widget? child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: newPage,
              );
            }
          ),
          Positioned.fill(
            child: NavigationRadial(
              pageOptions: pageOptions,
              onSelection: (newPage) {
                final int pageIndex = _getPageIndexFromPageName(newPage);
                currentPage.value = pageOptions[pageIndex].child;
              },
              isDisabled: _checkIfDisabled,
            ),
          ),
        ],
      ),
    );
  }

  bool _checkIfDisabled() {
    return false;
  }

  List<PageOption> _getPageOptions() {
    List<PageOption> list = [];

      PageOption option = PageOption();
      option.name = 'Home';
      option.iconData = CustomIcons.home;
      option.child = const Home();
      list.add(option);

      option = PageOption();
      option.name = 'Raven';
      option.iconData = CustomIcons.dove;
      option.child = const Raven();
      list.add(option);

      option = PageOption();
      option.name = 'Flower';
      option.iconData = CustomIcons.leaf;
      option.child = const Flower();
      list.add(option);
      
      option = PageOption();
      option.name = 'Kitten';
      option.iconData = CustomIcons.cat;
      option.child = const Kitten();
      list.add(option);
      
      option = PageOption();
      option.name = 'Moon';
      option.iconData = CustomIcons.moon;
      option.child = const Moon();
      list.add(option);
      
      option = PageOption();
      option.name = 'Planets';
      option.iconData = CustomIcons.planet;
      option.child = const Planets();
      list.add(option);
     
    return list;
  }

  int _getPageIndexFromPageName(String name) {
    for (int i = 0; i < pageOptions.length; i++) {
      if (pageOptions[i].name == name) {
        return i;
      }
    }

    return 0;
  }
}