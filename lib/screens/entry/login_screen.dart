import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:reserva_ai_common_user/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Exibir Senha
  bool _obscureText = true;

  //Exibe botão showPassword
  bool _showPasswordButton = false;

  //Chave que realiza a validação dos campos
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Icones button showPassword
  IconData _eyePassword = FontAwesomeIcons.eye;

  //Controllers email e senha
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  VoidCallback onSucess() {

    SnackBar snackbar = SnackBar(
      content: Text(
        'Usuário Logado Com Sucesso',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
    );
    FocusScope.of(context).unfocus(); //Para fechar o teclado
    _scaffoldKey.currentState.showSnackBar(snackbar);
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Serve para fechar o Drawer
      Navigator.of(context).popUntil((route) => route.isFirst);


    });
    return null;
  }

  VoidCallback onFail() {
    SnackBar snackbar = SnackBar(
      content: Text(
        'Usuário Não Existe, Ou Senha Inválida !',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
    return null;
  }

  void _signIn(UserModel model, String email, String senha) {
    FocusScope.of(context).unfocus(); //Para fechar o teclado
    model.signIn(
        email: email, password: senha, onSucess: onSucess, onFail: onFail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color.fromRGBO(253, 91, 62, 1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 700.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    height: 60,
                    width: 200,
                    child: FlatButton(
                      child: Text(
                        'Esqueceu a senha?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: Colors.white),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      highlightColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                    ),
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(5, 41, 60, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0))),
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, right: 290),
                      child: Container(
                        height: 50,
                        child: FlatButton(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 200),
                        child: Text('Olá!',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 220),
                  child: Center(
                    child: Container(
                      height: 450,
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      child: ScopedModelDescendant<UserModel>(
                        builder: (child, context, model) {
                          if (model.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Color.fromRGBO(5, 41, 60, 1),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color.fromRGBO(253, 91, 62, 1)),
                              ),
                            );
                          }

                          return Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, bottom: 30),
                                    child: Text(
                                      'Bem vindo de volta',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 26,
                                          color: Color.fromRGBO(5, 41, 60, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 30,
                                        right: 30,
                                        bottom: 5),
                                    child: TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: Color.fromRGBO(5, 41, 60, 1),
                                      decoration: InputDecoration(
                                          prefix: Container(
                                            width: 36,
                                            height: 36,
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            child: FaIcon(
                                              FontAwesomeIcons.userAlt,
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1),
                                            ),
                                          ),
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                              fontSize: 22,
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      5, 41, 60, 1)))),
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1),
                                              fontSize: 20)),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Insira seu e-mail!';
                                        else if (!EmailValidator.validate(
                                            value))
                                          return 'Insira um e-mail válido!';
                                        else
                                          return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 30,
                                        right: 30,
                                        bottom: 30),
                                    child: TextFormField(
                                      controller: _senhaController,
                                      obscureText: _obscureText,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      cursorColor: Color.fromRGBO(5, 41, 60, 1),
                                      decoration: InputDecoration(
                                          prefix: Container(
                                            width: 36,
                                            height: 36,
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            child: FaIcon(
                                              FontAwesomeIcons.lock,
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1),
                                            ),
                                          ),
                                          labelText: 'Senha',
                                          labelStyle: TextStyle(
                                              fontSize: 22,
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      5, 41, 60, 1))),
                                          suffix: Container(
                                              width: 60,
                                              height: 50,
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 10),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_obscureText) {
                                                      _obscureText = false;
                                                      _eyePassword =
                                                          FontAwesomeIcons
                                                              .eyeSlash;
                                                    } else {
                                                      _obscureText = true;
                                                      _eyePassword =
                                                          FontAwesomeIcons.eye;
                                                    }
                                                  });
                                                },
                                                icon: FaIcon(
                                                  _eyePassword,
                                                  color: _showPasswordButton
                                                      ? Color.fromRGBO(
                                                          5, 41, 60, 1)
                                                      : Colors.white,
                                                ),
                                              ))),
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1),
                                              fontSize: 20)),
                                      onChanged: (value) {
                                        setState(() {
                                          if (value.length > 0)
                                            _showPasswordButton = true;
                                          else
                                            _showPasswordButton = false;
                                          if (value.length >= 8)
                                            _formKey.currentState.validate();
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Insira sua senha!';
                                        else if (value.length < 8)
                                          return 'Sua senha precisa ter pelo menos 8 caracteres!';
                                        else
                                          return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:20),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            color:
                                                Color.fromRGBO(253, 91, 62, 1)),
                                        height: 50.0,
                                        width: 150.0,
                                        child: FlatButton(
                                          child: Text(
                                            'Entrar',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _signIn(
                                                  model,
                                                  _emailController.text,
                                                  _senhaController.text);
                                            }
                                          },
                                          highlightColor: Color.fromRGBO(253, 91, 62, 1),
                                        )),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
