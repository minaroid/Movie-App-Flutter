import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyScreen();
  }
}

class MyScreen extends State<ListDemo2> {
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
                                fit: BoxFit.cover,
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
          Image.network("https://www.visitportugal.com/sites/www.visitportugal.com/files/mediateca/23_660x371.jpg"),
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
