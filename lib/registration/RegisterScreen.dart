
import 'package:flutter/material.dart';

class RegisterScreen  extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<RegisterScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(title: Text("Register"),),

        body: GestureDetector(
          child: Center(child: Text("Login"),),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

}


