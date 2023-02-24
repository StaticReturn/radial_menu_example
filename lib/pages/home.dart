import 'package:flutter/material.dart';
import 'package:radial_menu_example/data/spacing.dart';
import 'package:radial_menu_example/data/strings_en.dart';


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageSize = MediaQuery.of(context).size.height / 2.83;

    return Container(
      color: Colors.grey.shade100,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: imageSize - 100,
            expandedHeight: imageSize,
            flexibleSpace: Image.asset(
              'assets/images/hobbit_home.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: verticalScreenPadding, horizontal: horizontalScreenpadding),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => _getWidgets(index),
                childCount: 4
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getWidgets(int index) {
    switch(index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '\t\tI',
                  style: TextStyle(fontFamily: 'MeaCulpa', fontSize: 24.0, color: Colors.brown.shade900)
                ),
                const WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.0),
                  ),
                ),
                TextSpan(
                  text: stringListTheHobbit[index],
                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 18.0, color: Colors.brown.shade900)
                ),
              ]
            ),
          ),
        );
      case 1:
      case 2:
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(
            '\t\t\t${stringListTheHobbit[index]}',
            textAlign: TextAlign.justify,
            style: TextStyle(fontFamily: 'OpenSans', fontSize: 18.0, color: Colors.brown.shade900),
          ),
        );
      case 3:
        return Text(
          stringTheHobbitExcerpt,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, color: Colors.brown.shade900),
        );
      default:
        return const SizedBox();
    }
  }
}