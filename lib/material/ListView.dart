import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Screen();
  }
}

class Screen extends State<ListViewScreen> {
  var HList = [4, 4, 4, 4, 4, 4, 4, 4];
  var VList = [4, 4, 4, 4, 4, 4, 4, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: HList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    child: CircleImage(
                      width: 100,
                      height: 100,
                    ),
                    padding: EdgeInsets.all(10),
                  );
                }),
          ),
          new Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: HList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    child: CircleImage(
                      width: 100,
                      height: 100,
                    ),
                    padding: EdgeInsets.all(10),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  double width;
  double height;

  CircleImage({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
          width: width,
          height: height,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      "https://www.woolha.com/media/2019/06/buneary.jpg")))),
    );
  }
}
