import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/movies/MyApp.dart';
import 'package:movie_app/registration/RegistrationApp.dart';

import 'movies/MovieModel.dart';

void main() {
  runApp(MyApp());
}

//class App extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return MoviesState();
//  }
//}
//
//class MoviesState extends State<App> {
//  int _selectedIndex = 0;
//  int counter = 1;
//  List<MovieModel> movies = List();
//
//  Future fetchPopularMovies() async {
//    var response = await get(
//        "https://api.themoviedb.org/3/movie/popular?api_key=c23c8f8855a040042f0433b7696f9d65&page=$counter&language=ar");
//    setState(() {
//      movies
//          .addAll(MoviesResponse.fromJson(json.decode(response.body)).results);
//      counter += 1;
//    });
//    print(movies);
//  }
//
//  Future fetchTopRatedMovies() async {
//    var response = await get(
//        "https://api.themoviedb.org/3/movie/top_rated?api_key=c23c8f8855a040042f0433b7696f9d65&page=$counter&language=ar");
//    setState(() {
//      print(response.body.toString());
//      movies.addAll(MoviesResponse.fromJson(json.decode(response.body)).results);
//      counter += 1;
//    });
//
//    print(movies);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("MovieApp"),
//          backgroundColor: Colors.amber,
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.add_alarm),
//              onPressed: () {
//                print("action one");
//              },
//            ),
//            IconButton(
//              icon: Icon(Icons.add_alarm),
//              onPressed: () {},
//            ),
//            IconButton(
//              icon: Icon(Icons.add_alarm),
//              onPressed: () {},
//            )
//          ],
//        ),
//        bottomNavigationBar: BottomNavigationBar(
//          items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('Top Rated'),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.business),
//              title: Text('Popular'),
//            ),
//          ],
//          currentIndex: _selectedIndex,
//          selectedItemColor: Colors.amber[800],
//          onTap: (int index) {
//            setState(() {
//              movies = [];
//              counter = 1;
//              _selectedIndex = index;
//              if (index == 0)
//                fetchTopRatedMovies();
//              else
//                fetchPopularMovies();
//            });
//          },
//        ),
//        body: ListView.builder(
//            itemCount: movies.length,
//            itemBuilder: (context, index) {
//
//              if (index == movies.length - 1) {
//               // end
//                if (_selectedIndex == 0)
//                  fetchTopRatedMovies();
//                else
//                  fetchPopularMovies();
//
//              }
//
//              return movieItem(movies[index]);
//            }),
//      ),
//    );
//  }
//
//  Widget movieItem(MovieModel model) {
//    return Container(
//      margin: EdgeInsets.all(5),
//      padding: EdgeInsets.all(5),
//      width: double.infinity, // match parent
//      child: Column(
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Container(
//                margin: const EdgeInsets.all(5.0),
//                child: new Container(
//                  width: 70.0,
//                  height: 70.0,
//                ),
//                decoration: new BoxDecoration(
//                  borderRadius: new BorderRadius.circular(10.0),
//                  color: Colors.grey,
//                  image: new DecorationImage(
//                      image: new NetworkImage(
//                          'https://image.tmdb.org/t/p/w500/' +
//                              model.posterPath),
//                      fit: BoxFit.cover),
//                  boxShadow: [
//                    BoxShadow(
//                        color: Colors.blue,
//                        blurRadius: 8.0,
//                        offset: new Offset(5.0, 5.0))
//                  ],
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(left: 8),
//              ),
//              Expanded(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      model.title,
//                      style: TextStyle(fontSize: 14, fontFamily: "Arvooooo"),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 2),
//                    ),
//                    Text(
//                      model.overview,
//                      maxLines: 3,
//                      style: TextStyle(fontFamily: "arvo2"),
//                    )
//                  ],
//                ),
//              )
//            ],
//          ),
//          Container(
//            color: Colors.grey,
//            height: 1,
//            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
//            width: double.infinity,
//          )
//        ],
//      ),
//    );
//  }
//}
