import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationSplash extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RegistrationSplashState();
  }

}

class RegistrationSplashState extends State<RegistrationSplash> {


  @override
  void initState() {
    Timer(Duration(milliseconds: 2000),(){
      Navigator.of(context).pushReplacementNamed("/login");
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Image.asset("assets/images/splashIcon.jpg"),),),
    );
  }

}