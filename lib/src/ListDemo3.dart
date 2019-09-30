import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDemo3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyScreen();
  }
}

class MyScreen extends State<ListDemo3> {
  var itmes = [1, 2, 3, 4, 5, 5, 6, 678, 88, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: itmes.length,
          itemBuilder: (context, index) {
            return myItem(index);
          }),
    );
  }

  Widget myItem(int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://www.woolha.com/media/2019/06/buneary.jpg")))),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "minageorge",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    )
                  ],
                ),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          Image.network("https://video.cgtn.com/news/3167544e32636a4e31637a4d7a6b544f314d6a4e31457a6333566d54/video/14dfaac655aa4c4e8b1dbfdbd8c92c49/14dfaac655aa4c4e8b1dbfdbd8c92c49.png",fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.favorite_border),),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.folder_shared),),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.ac_unit),)

                  ],
                ),
                Icon(Icons.add_alarm)
              ],
            ),
          ),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.all(5),
              child: Text("$index  Likes",textAlign: TextAlign.left),)
          ],)
        ],
      ),
    );
  }
}
