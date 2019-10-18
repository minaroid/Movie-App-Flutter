import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'LoginResponse.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<RegisterScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  BuildContext context;
  String dropdownValue = 'Yemen';
  List<String> countries = ['Egypt', 'Yemen'];

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
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
                keyboardType: TextInputType.text,
                controller: firstNameController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'first name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: lastNameController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'last name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: 'phone'),
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
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[

                  Padding(padding: EdgeInsets.only(right: 20),
                  child: Text("Gender",style: TextStyle(fontSize: 20),),),
                  DropdownButton<String>(

                    value: dropdownValue,
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
//                    underline: Container(
//                      height: 2,
//                      color: Colors.deepPurpleAccent,
//                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: countries
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: register,
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  splashColor: Colors.grey,
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("You have an account ?"),
                ),
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
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future register() async {
    var response = await Dio()
        .post("https://mina-george.com/demos/Api.php?apicall=signup", data: {
      "email": emailController.text,
      "password": passwordController.text,
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "gender": dropdownValue,
      "phone": phoneController.text
    });

    LoginResponse myResponse =
        LoginResponse.fromJson(json.decode(response.data));
    if (myResponse.message == "User registered successfully") {
      navigateToMovies();
    } else {
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
}
