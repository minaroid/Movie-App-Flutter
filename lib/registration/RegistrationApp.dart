import 'package:flutter/material.dart';
import 'package:movie_app/movies/MoviesListScreen.dart';
import 'package:movie_app/registration/LoginScreen.dart';
import 'package:movie_app/registration/RegisterScreen.dart';
import 'package:movie_app/registration/RegistrationSplash.dart';

import 'GalleryScreen.dart';
import 'SMSScreen.dart';
import 'VideoScreen.dart';

class RegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationSplash(),
        '/login': (context) => LoginScreen(),
        '/movies': (context) => MoviesListScreen(),
        '/login/register': (context) => RegisterScreen(),
        '/login/movies': (context) => MoviesListScreen(),
      },
    );
  }
}
