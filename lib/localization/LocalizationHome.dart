import 'package:flutter/material.dart';

class LocalizationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return LocalizationState();
  }
}

class LocalizationState extends State<LocalizationScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:Text("Hello")),
    );
  }

}