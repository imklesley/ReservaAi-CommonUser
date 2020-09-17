import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/models/user_model.dart';
import 'package:reserva_ai_common_user/screens/entry/entry_screen.dart';
import 'package:reserva_ai_common_user/screens/tiles/drawer_tile.dart';
import 'package:reserva_ai_common_user/screens/widgets/build_background_drawer.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  PageController pageController;
  List<dynamic> _screenPages;

  CustomDrawer(this.pageController, this._screenPages);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: [
        BuildBackgroundDrawer(),
        ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            Container(
              height: 220,
              width: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 0.0,
                    top: 50.0,
                    child: Image.asset(
                      'assets/images/logotypes/branco-laranja.png',
                      fit: BoxFit.cover,
                      height: 80,
                    ),
                  ),
                  ScopedModelDescendant<UserModel>(
                    builder: (context, child, model) {
                      return Stack(
                        children: [
                          Positioned(
                            bottom: 35,
                            left: 25,
                            child: Text(
                              'Olá, ${model.isLoggedIn() && model.userData['name'].split(' ')[0] != null ? model.userData['name'].split(' ')[0] : ""}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 22.0),
                            ),
                          ),
                          Positioned(
                            left: 11,
                            bottom: 0.0,
                            child: Container(
                              height: 30,
                              child: model.isLoggedIn()
                                  ? null
                                  : FlatButton(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Entre ou Cadastra-se',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (!model.isLoggedIn()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EntryScreen()));
                                        }
                                      },
                                      splashColor: Colors.black,
                                      highlightColor:
                                          Color.fromRGBO(253, 91, 62, 1),
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 30,
            ),
            DrawerTile(FontAwesomeIcons.solidBookmark, 'Locais Favoritados',
                pageController, _screenPages, 5),
            DrawerTile(FontAwesomeIcons.storeAlt, 'Estabelecimentos',
                pageController, _screenPages, 6),
            DrawerTile(FontAwesomeIcons.shopify, 'Cupons', pageController,
                _screenPages, 7),
          ],
        ),
      ],
    ));
  }
}
