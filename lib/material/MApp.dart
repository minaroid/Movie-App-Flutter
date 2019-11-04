import 'package:flutter/material.dart';
import 'package:movie_app/material/DrawerScreen.dart';
import 'package:movie_app/movies/MoviesListScreen.dart';
import 'package:movie_app/registration/LoginScreen.dart';
import 'package:movie_app/registration/RegisterScreen.dart';
import 'package:movie_app/registration/RegistrationSplash.dart';
import 'package:movie_app/src/InstaDemo.dart';
import 'package:movie_app/src/ListDemo.dart';
import 'package:movie_app/src/ListDemo2.dart';

import 'CollapsingToolbarScreen.dart';
import 'ListView.dart';
import 'SwiperScreen.dart';

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ListViewScreen(),
      },
    );
  }
}
