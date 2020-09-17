import 'package:email_validator/email_validator.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:reserva_ai_common_user/models/user_model.dart';
import 'package:reserva_ai_common_user/screens/entry/login_screen.dart';
import 'package:reserva_ai_common_user/screens/pages/home/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Ativador de _autoValidate
  bool _autoValidateSenha = false;
  bool _autoValidateCPF = false;

  //Exibir ou não Senha
  bool _obscureTextSenha = true;

  //Exibe botão showPassword "IconButton" de um olho
  bool _showPasswordButton = false;

  //Icones button showPassword
  IconData _eyePassword = FontAwesomeIcons.eye;

  //Chave que realiza a validação dos campos
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //Controllers

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _dataDeNascimentoController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _nCelularController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  void _onChangedSenha(String value) {
    setState(() {
      if (value.isNotEmpty)
        _showPasswordButton = true;
      else
        _showPasswordButton = false;
    });
  }

  void _onChangedCPF(value) {
    if (value.length == 11) _autoValidateCPF = true;
  }

  String _validatorNome(String value) {
    //Verifica se o nome está minimamente correto
    if (value.isEmpty)
      return 'Insira seu nome!';
    else if (value.split(' ').length < 2)
      return 'Insira seu nome completo!';
    else if (value.contains(RegExp(r'[1-9]'), 1)) return 'Verifique seu nome!';
  }

  String _validatorCPF(String value) {
    if (value.isEmpty) {
      _autoValidateCPF = true;
      return 'Insira seu CPF!';
    } else if (!CPF.isValid(value)) {
      _autoValidateCPF = true;
      return 'Insira um CPF válido!';
    } else if (_autoValidateCPF) {
      _cpfController.text = CPF.format(value);
    }
  }

  String _validatorEmail(String value) {
    if (value.isEmpty)
      return 'Insira seu e-mail!';
    else if (!EmailValidator.validate(value)) return 'Insira um e-mail válido!';
  }

  String _validatorSenha(String value) {
    if (value.isEmpty)
      return 'Insira sua senha';
    else if (value.length < 8)
      return 'Sua senha precisa ter pelo menos 8 caracteres!';
  }

  VoidCallback onSucess() {
    SnackBar snackbar = SnackBar(
      content: Text(
        'Usuário Criado Com Sucesso',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
    );

    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(snackbar);
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });

    _scaffoldKey.currentState.openEndDrawer();

  }

  VoidCallback onFail() {
    SnackBar snackbar = SnackBar(
      content: Text(
        'Ocorreu um erro ao criar usuário. Tente mais tarde !',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void _submitRegister(UserModel model) {
    FocusScope.of(context).unfocus(); //Para fechar o teclado
    Map<String, dynamic> data = {
      'name': _nomeController.text,
      'email': _emailController.text,
      'cpf': _cpfController.text
    };
    model.signUp(
        userData: data,
        password: _senhaController.text,
        onSucess: onSucess,
        onFail: onFail);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(253, 91, 62, 1)),
              ),
            );
          else
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    color: Color.fromRGBO(253, 91, 62, 1),
                    height: MediaQuery.of(context).size.height + 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 750.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          height: 60,
                          width: 200,
                          child: FlatButton(
                            child: Text(
                              'Já possui conta?',
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
                                      builder: (context) => LoginScreen()));
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
                                  Icons.keyboard_backspace,
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
                              padding: const EdgeInsets.only(
                                  top: 20, right: 50, left: 10),
                              child: Text('Cadastro',
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
                        padding: EdgeInsets.only(top: 200),
                        child: Center(
                          child: Container(
                            height: 560,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Junte-se a nós!',
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
                                            left: 30, right: 30),
                                        child: TextFormFieldBuilder(
                                            false,
                                            TextInputType.text,
                                            _nomeController,
                                            FontAwesomeIcons.userAlt,
                                            'Nome Completo',
                                            false,
                                            null,
                                            _validatorNome),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: TextFormFieldBuilder(
                                              false,
                                              TextInputType.number,
                                              _cpfController,
                                              FontAwesomeIcons.idCardAlt,
                                              'CPF',
                                              false,
                                              _onChangedCPF,
                                              _validatorCPF)),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: TextFormFieldBuilder(
                                              false,
                                              TextInputType.emailAddress,
                                              _emailController,
                                              FontAwesomeIcons.mailBulk,
                                              'Email',
                                              false,
                                              null,
                                              _validatorEmail)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30, bottom: 50),
                                        child: TextFormFieldBuilder(
                                            true,
                                            TextInputType.text,
                                            _senhaController,
                                            FontAwesomeIcons.lock,
                                            'Senha',
                                            _autoValidateSenha,
                                            _onChangedSenha,
                                            _validatorSenha),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0)),
                                              color: Color.fromRGBO(
                                                  253, 91, 62, 1)),
                                          height: 50.0,
                                          width: 150.0,
                                          child: FlatButton(
                                            child: Text(
                                              'Cadastrar',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _submitRegister(model);
                                              }
                                            },
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
        },
      ),
    );
  }

  Widget TextFormFieldBuilder(
      bool isSenha,
      TextInputType keyboardType,
      TextEditingController controller,
      IconData prefixIcon,
      String labelText,
      bool autoValidate,
      Function onChangedFunction,
      Function validatorFunction) {
    return TextFormField(
      obscureText: isSenha ? _obscureTextSenha : false,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: Color.fromRGBO(5, 41, 60, 1),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(102, 68, 204, 1))),
        prefix: Container(
          width: 36,
          height: 36,
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: FaIcon(
            prefixIcon,
            color: Color.fromRGBO(5, 41, 60, 1),
          ),
        ),
        suffix: isSenha
            ? Container(
                width: 60,
                height: 50,
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (_obscureTextSenha) {
                        _obscureTextSenha = false;
                        _eyePassword = FontAwesomeIcons.eyeSlash;
                      } else {
                        _obscureTextSenha = true;
                        _eyePassword = FontAwesomeIcons.eye;
                      }
                    });
                  },
                  icon: FaIcon(
                    _eyePassword,
                    color: _showPasswordButton
                        ? Color.fromRGBO(5, 41, 60, 1)
                        : Colors.white,
                  ),
                ))
            : null,
        labelText: labelText,
        labelStyle:
            TextStyle(fontSize: 20, color: Color.fromRGBO(5, 41, 60, 1)),
      ),
      style: GoogleFonts.montserrat(
          textStyle:
              TextStyle(color: Color.fromRGBO(5, 41, 60, 1), fontSize: 20)),
      autovalidate: autoValidate,
      validator: validatorFunction,
      onChanged: onChangedFunction,
    );
  }
}
