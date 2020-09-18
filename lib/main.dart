import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:reserva_ai_common_user/screen_controller.dart';
import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*FORMAS DE REALIZAR FULLSCREEN NO FLUTTER ANDROID*/
    // to hide only bottom bar:
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    // to hide only status bar:
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    // to hide both:
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return ScopedModel(
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return MaterialApp(
              title: 'Reserva Ai!',
              debugShowCheckedModeBanner: false,
              home: ScreenController(),
              theme: ThemeData(
                fontFamily: 'Montserrat',
                primaryColor: Color.fromRGBO(5, 41, 60, 1),
                primarySwatch: Colors.deepOrange,
                cursorColor: Color.fromRGBO(5, 41, 60, 1),

              ),
            );
          },
        ));
  }
}
