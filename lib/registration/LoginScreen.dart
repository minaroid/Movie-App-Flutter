import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/registration/LoginResponse.dart';

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

  @override
  Widget build(BuildContext context) {
    this.context = context;
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
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
                keyboardType: TextInputType.emailAddress,
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future login() async {
    var response = await Dio()
        .post("https://mina-george.com/demos/Api.php?apicall=login", data: {
      "email": emailController.text,
      "password": passwordController.text
    });

    LoginResponse myResponse =
        LoginResponse.fromJson(json.decode(response.data));
    if (myResponse.message == "Login successfull") {
      navigateToMovies();
    }else{
      Fluttertoast.showToast(
        msg: myResponse.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    }
  }

  void navigateToMovies() {
    Navigator.of(context).pushNamed("/login/movies");
  }

//  Future login() async {
//    var response = await Dio().post("https://mina-george.com/demos/Api.php?apicall=login", data: {"email": emailController.text, "password": passwordController.text});
//
//    print("response Is :$response");
//
//        Fluttertoast.showToast(
//        msg: "This is Center Short Toast",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.BOTTOM,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.black,
//        textColor: Colors.white,
//        fontSize: 16.0);
//
//  }

//  https://api.flutter.dev/flutter/material/DropdownButton-class.html
}
