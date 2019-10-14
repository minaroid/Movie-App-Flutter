
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/registration2/LoginTwoScreen.dart';

class RegistrationTwoApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginTwoScreen(),
//        '/login': (context) => LoginScreen(),
//        '/login/register': (context) => RegisterScreen(),
      },
    );
  }

}