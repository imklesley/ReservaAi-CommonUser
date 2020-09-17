import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'forgot_password_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';

//Contém a página inicial do app caso o usuário não esteja logado

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color.fromRGBO(5, 41, 60, 1),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 580),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: Colors.red,
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 25.0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    ),
                    height: 60,
                    width: 300,
                  ),
                  Divider(
                    color: Colors.transparent,
                  ),
                  Container(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: Color.fromRGBO(9, 53, 75, 1),
                      child: Text('Cadastrar',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25.0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                    ),
                    height: 60,
                    width: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: FlatButton(
                      highlightColor: Color.fromRGBO(253, 91, 62, 1),
                      child: Text(
                        'Esqueceu a senha?',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: Colors.white)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(253, 91, 62, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0))),
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Positioned(
              top:30,
              left: 5,
              child: Container(
                  height: 40,
                  width: 100,
                  child: FlatButton(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {Navigator.pop(context);},
                    highlightColor: Theme.of(context).primaryColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Reserva ',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )),
                      TextSpan(
                          text: 'Ai\n\n\n',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(5, 41, 60, 1),
                                fontWeight: FontWeight.w800),
                          )),
                    ]),
                  ),
                  Text(
                    'Olá!\nSeja bem \nvindo!\n\n',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                  ),
                  Text(
                      'Aqui você faz reserva no seu \nlocal favorito e de forma fácil!',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
