import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/models/user_model.dart';
import 'package:reserva_ai_common_user/screens/entry/entry_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Theme.of(context).primaryColor,
              ),
              height: 80,
            ),
            Positioned(
              top: 16,
              left: 4,
              child: IconButton(
                highlightColor: Colors.deepOrange,
                color: Colors.white,
                icon: FaIcon(FontAwesomeIcons.bars),
                iconSize: 25.0,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Card(
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.white, width: 3)),
                      elevation: 30,
                      child: model.isLoggedIn() &&
                              (model.userData['profile_picture'] != null &&
                                  model.userData['profile_picture'] != '')
                          ? CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  model.userData['profile_picture']),
                            )
                          : CircleAvatar(
                              backgroundColor: Theme.of(context).highlightColor,
                              radius: 70,
                              child: Icon(
                                Icons.person,
                                size: 100,
                                color: Colors.white,
                              ),
                            )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    child: model.isLoggedIn()
                        ? Center(
                            child: Text(
                              '${model.userData['name']}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 22.0),
                            ),
                          )
                        : FlatButton(
                            highlightColor: Theme.of(context).primaryColor,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Entre ou Cadastra-se',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(253, 91, 62, 1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EntryScreen()));
                            },
//                      highlightColor: Theme.of(context).primaryColor,
                          ),
                  ),
                ])
              ]),
            ),
            Positioned(
              top: 300,
              child: Column(
                children: [
                  Container(
                      height: 70,
                      width: size.width,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Meus Dados',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width - 225,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                        onPressed: () {},
                        highlightColor: Color.fromRGBO(253, 91, 62, 1),
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      height: 70,
                      width: size.width,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Minhas Preferências',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width - 297,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                        onPressed: () {},
                        highlightColor: Color.fromRGBO(253, 91, 62, 1),
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      height: 70,
                      width: size.width,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_open,
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Segurança',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width - 211,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                        onPressed: () {},
                        highlightColor: Color.fromRGBO(253, 91, 62, 1),
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                      height: 70,
                      width: size.width,
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_outline,
                              size: 30,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Ajuda',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width - 166,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                        onPressed: () {},
                        highlightColor: Color.fromRGBO(253, 91, 62, 1),
                      )),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Encerrar Acesso',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (model.isLoggedIn()) {
                                SnackBar snack = SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                    '${model.userData['name'].split(' ')[0]} sua sessão foi encerrada com sucesso !',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.green,
                                );
                                model.signOut();

                                //Fecha drawer
                                Scaffold.of(context).openEndDrawer();
                                //Caso tem algum outro snackbar remove
                                Scaffold.of(context).removeCurrentSnackBar();
                                //Mostra o novo snackbar do usuário
                                Scaffold.of(context).showSnackBar(snack);

                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              } else
                                SystemChannels.platform.invokeMethod(
                                    'SystemNavigator.pop'); // A library Services permite darmos um pop no próprio app
                            },
                            highlightColor: Color.fromRGBO(253, 91, 62, 1),
                          ),
                          Text(
                            'Versão 0.8.0',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        );
      },
    );
  }
}
