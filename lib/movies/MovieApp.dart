import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'MovieModel.dart';

class MovieApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavScreen();
  }
}

class BottomNavScreen extends State<MovieApp> {
  int _selectedIndex = 0;
  int counter = 1;
  List<MovieModel> movies = List();
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text(_selectedIndex == 0
                  ? "Top Rated Movies"
                  : "Popular Rated Movies")),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Top Rated'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('popular '),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {

            return MovieCell(movies[index]);
          })),
    );
  }

  Future fetchPopularMovies() async {
    var response = await get(
        "https://api.themoviedb.org/3/movie/popular?api_key=c23c8f8855a040042f0433b7696f9d65&page=$counter");
    setState(() {
      movies
          .addAll(MoviesResponse.fromJson(json.decode(response.body)).results);
      counter += 1;
    });
    print(movies);
  }

  Future fetchTopRatedMovies() async {
    var response = await get(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=c23c8f8855a040042f0433b7696f9d65&page=$counter");
    setState(() {
      movies
          .addAll(MoviesResponse.fromJson(json.decode(response.body)).results);
      counter += 1;
    });
    print(movies);
  }

  Widget movieItem(MovieModel model) {
    return Container(
      width: 100,
      color: Colors.black12,
      height: 180,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
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
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.only(top: 10, right: 5, left: 5)),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
      counter = 1;
      movies = List();
      isGrid = true;
      if (index == 0)
        fetchPopularMovies();
      else if (index == 1) fetchTopRatedMovies();
    });
  }
}


class MovieCell extends StatelessWidget {
  final MovieModel movie;

  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
         Row(
          children: <Widget>[
            new Padding(
              padding:  EdgeInsets.all(0.0),
              child:  Container(
                margin: const EdgeInsets.all(16.0),
//                                child: new Image.network(image_url+movie.posterPath,width: 100.0,height: 100.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(image_url + movie.posterPath),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            new Expanded(
                child:  Container(
              margin:  EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child:  Column(
                children: [
                  new Text(
                    movie.title,
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    movie.overview,
                    maxLines: 3,
                    style: new TextStyle(
                        color: const Color(0xff8785A4), fontFamily: 'Arvo'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )),
          ],
        ),
         Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
