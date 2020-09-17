import 'package:flutter/material.dart';

class BuildBackgroundHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Color.fromRGBO(5, 41, 60, 1),
                Color.fromRGBO(5, 41, 60, 1),
                Color.fromRGBO(253, 91, 62, 1)
              ])),
    );
  }
}
