import 'package:flutter/material.dart';
import 'package:movie_app/movies/MoviesListScreen.dart';
import 'package:movie_app/registration/LoginScreen.dart';
import 'package:movie_app/registration/RegisterScreen.dart';
import 'package:movie_app/registration/RegistrationSplash.dart';

class RegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationSplash(),
        '/login': (context) => LoginScreen(),
        '/login/movies': (context) => MoviesListScreen(),
      },
    );
  }
}
