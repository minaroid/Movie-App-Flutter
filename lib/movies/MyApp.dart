import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/movies/MoviesListScreen.dart';
import 'package:movie_app/movies/SplashScreen.dart';

import 'MovieDetailsScreen.dart';
import 'MovieModel.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/movies': (context) => MoviesListScreen(),
        '/movies/movie-details': (context) => MovieDetailsScreen(),
      },

    );
  }


}

