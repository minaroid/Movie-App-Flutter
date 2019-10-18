import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'MovieCell.dart';
import 'MovieModel.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieDetailsState();
  }
}

class MovieDetailsState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Text("MovieDetails"),
      ),
    ));
  }
}
