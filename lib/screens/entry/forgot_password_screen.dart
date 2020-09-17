import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:reserva_ai_common_user/models/user_model.dart';
import 'entry_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //Chave que realiza a validação dos campos
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Controllers email e senha
  final TextEditingController _emailController = TextEditingController();

  void _recoverPassword(UserModel model, String email) {
    model.recoverPass(email: email);
    _emailController.text = '';

    //Exibe msg
    SnackBar snackbar = SnackBar(
      content: Text(
        'Verifique seu email. Foi enviado um link de recuperação !',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    );
    FocusScope.of(context).unfocus(); //Para fechar o teclado
    _scaffoldKey.currentState.showSnackBar(snackbar);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EntryScreen()),
          (Route<dynamic> route) => false);
    });
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
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 35),
                        child: Text('Vamos te ajudar !',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 220),
                    child: Center(
                      child: Container(
                        height: 400,
                        width: 330,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                            if (model.isLoading)
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color.fromRGBO(253, 91, 62, 1)),
                                ),
                              );
                            else
                              return Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 50.0, bottom: 30),
                                        child: Text(
                                          'Recupere sua senha',
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 26,
                                              color:
                                                  Color.fromRGBO(5, 41, 60, 1),
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor:
                                              Color.fromRGBO(5, 41, 60, 1),
                                          decoration: InputDecoration(
                                              prefix: Container(
                                                width: 36,
                                                height: 36,
                                                padding: const EdgeInsets.only(
                                                    right: 10, top: 10),
                                                child: FaIcon(
                                                  FontAwesomeIcons.userAlt,
                                                  color: Color.fromRGBO(
                                                      5, 41, 60, 1),
                                                ),
                                              ),
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: Color.fromRGBO(
                                                      5, 41, 60, 1)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              5, 41, 60, 1)))),
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      5, 41, 60, 1),
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
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                                color: Color.fromRGBO(
                                                    253, 91, 62, 1)),
                                            height: 50.0,
                                            width: 250.0,
                                            child: FlatButton(
                                              child: Text(
                                                'Recuperar Senha',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22),
                                              ),
                                              onPressed: () {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  _recoverPassword(model,
                                                      _emailController.text);
                                                }
                                              },
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
            ),
          ],
        ),
      ),
    );
  }
}
