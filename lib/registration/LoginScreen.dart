
import 'package:flutter/material.dart';

class LoginScreen  extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(title: Text("Login"),),

        body: GestureDetector(
          child: Center(child: Text("Create account"),),
          onTap: (){
            Navigator.of(context).pushNamed("/login/register");

          },
        ),
      ),
    );
  }

}


