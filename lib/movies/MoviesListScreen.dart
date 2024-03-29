import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:movie_app/movies/MovieCell.dart';
import 'package:movie_app/registration/LoginResponse.dart';
import 'package:movie_app/registration/LoginResponse2.dart';
import 'package:movie_app/registration/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../SharedPreferencesHelper.dart';
import '../SharedPrefernceTwo.dart';
import 'MovieModel.dart';

class MoviesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoviesState();
  }
}

class MoviesState extends State<MoviesListScreen> {
  int _selectedIndex = 0;
  int counter = 1;
  List<MovieModel> movies = List();
  bool isGrid = false;
  LoginResponse2 response2 = null;

  void getUserData() async {
    response2 = await SharedPreferencesHelper.getResponse();
  }

  @override
  void initState() {
    super.initState();
    fetchTopRatedMovies();
    getUserData();
  }

  @override
  Widget build(BuildContext contextt) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Movie App")),
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
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('Profile '),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            body: _selectedIndex == 2
                ? Center(
                    child: Column(
                    children: <Widget>[
                      Text(response2 == null
                          ? "Name"
                          : " Welcom ${response2.user.name}"),
                      RaisedButton(
                        child: Text(
                          "Log out",
                          style: TextStyle(fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.blue)),

                        onPressed: logout,
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        splashColor: Colors.grey,
                      )
                    ],
                  ))
                : Stack(
                    children: <Widget>[
                      ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            print(contextt.toString());
                            MovieModel movie = movies[index];
                            return MovieCell(movie);
                          }),
                      movies.length == 0
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text("")
                    ],
                  )));
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
      else if (index == 1)
        fetchTopRatedMovies();
      else if (index == 2) fetchTopRatedMovies();
    });
  }

  void logout() async {
//    await SharedPreferencesHelper.logOut().then((value) {
//      if(value){
//        Navigator.of(context).pushReplacementNamed("/login");
//      }
//    });
  }

//  void logout() async {
//    await SharedPreferencesHelper.logOut().then((value) {
//      if (value) Navigator.of(context).pushReplacementNamed("/login");
//    });
//  }
}
