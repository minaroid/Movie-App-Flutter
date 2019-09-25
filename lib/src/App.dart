import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:movie_app/src/store/models/MovieModel.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 1;
  List<MovieModel> movies = List();

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: fetchMovies,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Movie App'),
        ),
        body: GridView.builder(
          itemBuilder: (context, index) {
            return movieItem(movies[index]);
          },
          itemCount: movies.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
    );
  }

  Widget movieItem(MovieModel model) {
    return Container(
      width: 100,
      height: double.infinity,
      margin: EdgeInsets.all(5),
      child: Image.network("https://image.tmdb.org/t/p/w500"+model.posterPath,fit: BoxFit.fill,),
    );
  }
}
