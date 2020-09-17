import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        toolbarHeight: 110,
        elevation: 20,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Minha Agenda',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: FaIcon(FontAwesomeIcons.bars),
          iconSize: 25.0,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Center(
        child: Text(
          'Minha Agenda',textAlign: TextAlign.center,
          textScaleFactor: 4,
        ),
      ),
    );
  }
}
