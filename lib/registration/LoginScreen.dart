import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/SharedPrefernceTwo.dart';
import 'package:movie_app/registration/LoginResponse.dart';
import 'package:movie_app/registration/LoginResponse2.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SharedPreferencesHelper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  BuildContext context;
  SharedPreferences prefs;
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    this.context = context;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(
                "assets/images/splashIcon.jpg",
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'mina@example.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'password'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: login,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  splashColor: Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/login/register");
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Don't have an account ?"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login() async {
    pr.show();

    var response = await Dio()
        .post("http://173.212.215.45:5040/PaymentService/api/v1/Login",
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
              },
            ),
            data: {
          "Channel": "3",
          "ApiKey": "SfSowleejxCY7v+LkbsISUB+UilvCXXu0y/dzQ1SZvQ=",
          "PublicKey":
              "zWnf+AEHeDjoMx6oHeQvcMJbZT3zAbSI04f7lYWNn4AwqQ3RJaDD4j3xvFURNXb2NRXgMhj7pSr1XXp3w1YftNedfYhDSPhbiyAReNqBzj+r975g631RvPL7hvUpduI/d4qYjdtwaA4Dkjw46vJlLfILJoB+b7kt76Kri/3o3K8=",
          "UserName": "باسم",
          "Password": "715857851",
        });

    pr.hide();

    LoginResponse2 myResponse = LoginResponse2.fromJson(json.decode(json.encode(response.data)));

    if (myResponse.success) {
//      Fluttertoast.showToast(
//          msg: "Welcome ${myResponse.user.name}",
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.BOTTOM,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.black,
//          textColor: Colors.white,
//          fontSize: 16.0);

      await SharedPreferencesHelper.setResponse(myResponse);

      navigateToMovies();
    } else {
      Fluttertoast.showToast(
          msg: myResponse.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void navigateToMovies() {
    Navigator.of(context).pushReplacementNamed("/login/movies");
  }
}
