import 'package:flutter/material.dart';


class Kitten extends StatelessWidget {
  const Kitten({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          padding: const EdgeInsets.all(2.0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.amber.shade700,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset('assets/images/kitten.gif', key: const Key('kitten'))
          ),
        ),
      ),
    );
  }
}