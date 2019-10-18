import 'dart:convert';

import 'package:movie_app/registration/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

//void main(){
//
//if(SharedPreferencesHelper.setNumber(5) != null){
//
//}
////  ;
//
//}

class SharedPreferencesHelper {
  static final String _USER_KEY = "User-Key";
  static final String _NUMBER_KEY = "NUMBER-Key";

  static Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return User.fromJson(jsonDecode(prefs.getString(_USER_KEY)));
  }

  static Future<bool> setUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_USER_KEY, value);
  }


  static Future<bool> setNumber(int number) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt(_NUMBER_KEY, number);
  }

  static Future<int> getNumber() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(_NUMBER_KEY);
  }

}
