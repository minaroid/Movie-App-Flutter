import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' show get;
import 'package:movie_app/src/store/models/MovieModel.dart';

class InstaDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<InstaDemo> {
  List<MovieModel> movies = List();
  bool isGrid = false;

  // from internet
  Future fetchMovies() async {
    var response = await get("https://api.themoviedb.org/3/movie/popular?api_key=c23c8f8855a040042f0433b7696f9d65&page=1");
    setState(() {
      movies.addAll(MoviesResponse.fromJson(json.decode(response.body)).results);
    });
    print(movies);
  }

  Widget instaItem(MovieModel model) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 400,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Row(children: <Widget>[
                Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "https://www.woolha.com/media/2019/06/buneary.jpg")))),
                Padding(padding: EdgeInsets.only(left: 5),
                child: Text("minageorge",style: TextStyle(fontSize: 15),),)
              ],),
                Icon(Icons.more_vert)
              ],
            ),
            padding: EdgeInsets.all(5),
          ),

          Image.asset(
            "assets/images/myImage.jpeg",
            fit: BoxFit.fill,
            height: 220,
            width: double.infinity,
          ),

          Padding(
              child: Text(
                model.title,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(top: 10, right: 5, left: 5)),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchMovies();
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_alarm),
          onPressed: () {
            print("floating button");
          },
        ),
        appBar: AppBar(
          title: Text('Movie App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(isGrid ? Icons.grid_off : Icons.grid_on),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return instaItem(movies[index]);
          },
          itemCount: movies.length,
        ),
      ),
    );
  }
}
