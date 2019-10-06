import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 1000),(){

//      Navigator.of(context).pushNamed('/movies');
      Navigator.of(context).pushNamed('/movies');

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.asset("assets/images/splashIcon.jpg"),
        ),
      ),
    );
  }
}

/*
Stack(
children: <Widget>[
ListView.builder(
itemCount: movies.length,
itemBuilder: (context, index) {
return GestureDetector(
child: MovieCell(movies[index]),
onTap: () => Scaffold.of(context).showSnackBar(
SnackBar(content: Text(index.toString()))),
);
}),
movies.length == 0
? Center(child: CircularProgressIndicator(),)
: Text("")
],
))*/
