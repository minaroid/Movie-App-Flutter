import 'package:flutter/material.dart';
import 'package:movie_app/material/DrawerScreen.dart';
import 'package:movie_app/movies/MoviesListScreen.dart';
import 'package:movie_app/registration/LoginScreen.dart';
import 'package:movie_app/registration/RegisterScreen.dart';
import 'package:movie_app/registration/RegistrationSplash.dart';

import 'CollapsingToolbarScreen.dart';
import 'SwiperScreen.dart';

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CollapsingToolbarScreen(),
      },
    );
  }
}
