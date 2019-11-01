import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:image_picker/image_picker.dart';

class SMSScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SMSState();
  }
}

class SMSState extends State<SMSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Text('send sms.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendSMS,
        tooltip: 'send sms',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _sendSMS() async {
    String message = "This is a test message!";
    List<String> recipents = ["1234567890", "5556787676"];

    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents)
            .catchError((onError) {
      print(onError);
    });

    print("testttt$_result");
  }

//  Future getImage() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);
//    setState(() {
//      _image = image;
//    });
//  }
}
