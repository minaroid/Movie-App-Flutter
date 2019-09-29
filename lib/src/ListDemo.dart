import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' show get;
import 'package:movie_app/src/store/models/MovieModel.dart';

class ListDemo extends StatefulWidget  {

  @override
  State<StatefulWidget> createState() {

    return HomeState();
  }
}

class HomeState extends State<ListDemo> {
  int counter = 1;
  List<MovieModel> movies = List();
  bool isGrid = false;

  // from internet
  Future fetchMovies() async {
    var response = await get(
        "https://api.themoviedb.org/3/movie/popular?api_key=c23c8f8855a040042f0433b7696f9d65&page=$counter");
    setState(() {
      movies
          .addAll(MoviesResponse.fromJson(json.decode(response.body)).results);
      counter += 1;
    });
    print(movies);
  }

  void changeLayout() {

    setState(() {

      isGrid = !isGrid;


    });
  }


  Widget movieItem(MovieModel model) {
    return Container(
      width: 100,
      color: Colors.black12,
      height: 300,
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            "https://images.unsplash.com/reserve/Af0sF2OS5S5gatqrKzVP_Silhoutte.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
            fit: BoxFit.fill,
            height: 140,
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

  Widget movieItemTwo(MovieModel model) {
    return Container(
      width: 100,
      color: Colors.black12,
      height: 180,
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            "https://image.tmdb.org/t/p/w500" + model.posterPath,
            fit: BoxFit.fill,
            height: 140,
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
              onPressed: changeLayout,
            ),
          ],
        ),
        body: isGrid? GridView.builder(
          itemBuilder: (context, index) {
//            if (index == movies.length - 1) fetchMovies();
            return movieItem(movies[index]);
          },
          itemCount: movies.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        )
            : ListView.builder(
          itemBuilder: (context, index) {
            if (index == movies.length - 1) fetchMovies();
            return movieItemTwo(movies[index]);
          },
          itemCount: movies.length,
        ),
      ),
    );
  }

}

