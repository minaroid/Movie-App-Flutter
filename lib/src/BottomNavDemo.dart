import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' show get;

class BottomNavDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HostState();
  }
}

class HostState extends State<BottomNavDemo> {
  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 1,
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          onPressed: () {},
        ),
        appBar: AppBar(title: Text('Movie App')),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 7.0,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    currentScreen = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    currentScreen = 1;
                  });
                },
              ),
              IconButton(
                icon: Container(),
                onPressed: (){
                  setState(() {
                    currentScreen = 2;
                  });
                }
                ,
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  setState(() {
                    currentScreen = 3;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    currentScreen = 4;
                  });
                },
              ),
            ],
          ),
        ),
        body: Text(currentScreen.toString()),
      ),
    );
  }
}


