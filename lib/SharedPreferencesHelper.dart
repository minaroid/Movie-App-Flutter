import 'dart:convert';

import 'package:movie_app/registration/LoginResponse.dart';
import 'package:movie_app/registration/LoginResponse2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String _USER_KEY = "user-key";

  static Future<bool> setResponse(LoginResponse2 response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_USER_KEY, json.encode(response.toJson()));
  }

  static Future<LoginResponse2> getResponse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_USER_KEY) == null) return null;
    return LoginResponse2.fromJson(json.decode(prefs.getString(_USER_KEY)));
  }

//  static getUser() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    if (prefs.getString(_USER_KEY) != null) {
//      User user = User.fromJson(jsonDecode(prefs.getString(_USER_KEY)));
//      return user;
//    }
//  }
//
//  static Future<bool> setUser(String value) async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.setString(_USER_KEY, value);
//  }
//
//
//
//
//  static Future<bool> logOut() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.remove(_USER_KEY);
//  }
}
