import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SharedPrefernceTwo.dart';
import 'LoginResponse.dart';

class RegistrationSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationSplashState();
  }
}

class RegistrationSplashState extends State<RegistrationSplash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed("/login");
//      if (isUserLogin() as bool) {
//        Navigator.of(context).pushReplacementNamed("/login");
//      } else {
//        Navigator.of(context).pushReplacementNamed("/movies");
//      }

    });
    super.initState();
  }

  Future<bool> isUserLogin() async {
    User user = await SharedPrefernceTwo.getUser();

    if (user == null)
      return false;
    else
      return true;
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
