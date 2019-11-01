import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SharedPreferencesHelper.dart';
import '../SharedPrefernceTwo.dart';
import 'LoginResponse.dart';
import 'LoginResponse2.dart';

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
      isLogin().then((value) {
        if (value == null) {
          Navigator.of(context).pushReplacementNamed("/login");
        } else {
          Navigator.of(context).pushReplacementNamed("/movies");
        }

      });
    });
    super.initState();
  }

  Future<LoginResponse2> isLogin() async {
    return await SharedPreferencesHelper.getResponse();
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

//void isLogin(){
//
//
//}

//bool isLogin(){
//
//  return true;
//}
//
//if(isLogin()){
//
//}
//
//Future<bool> isLogin2(){
//
//  return true;
//}
//
//isLogin2().then((value){
//
//
//})
