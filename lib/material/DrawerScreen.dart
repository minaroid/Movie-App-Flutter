import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawerState();
  }
}

class DrawerState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              accountName: Padding(
                child: Row(
                  children: <Widget>[
                    Text("Mina George"),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                padding: EdgeInsets.only(top: 10),
              ),
              accountEmail: Text("minageorge888@gmail.com"),
              currentAccountPicture: Container(
                  width: 80,
                  height: 80,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(
                              "https://www.woolha.com/media/2019/06/buneary.jpg")
                      )
                  )
              ),
            ),
            Flexible(
                child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Just Header 1"),
                ),
                ListTile(
                  dense: true,
                  title: Text("item 1"),
                  trailing: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 2"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 3"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 4"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child: Divider(height: 20,color: Colors.red,),),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Just Header 2"),
                ),
                ListTile(
                  title: Text("item 5"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 6"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 6"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 6"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 6"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 6"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  dense: true,
                  title: Text("item 7"),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                  child: Divider(height: 20,color: Colors.red,),),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  dense: true,
                  title: Text("Logout"),
                  trailing: Text(
                    "V 2.0",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  leading: new Image.asset(
                    "assets/images/splashIcon.jpg",
                    width: 20.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Center(child: Text("Body",))
    );
  }
}
