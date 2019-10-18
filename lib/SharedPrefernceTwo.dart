import 'dart:convert';

import 'package:movie_app/registration/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceTwo {
  static final String USER_KEY = "user-key";
  static final String REMBER_KEY = "rember-key";

  static Future<bool> setUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(USER_KEY, jsonEncode(user.toJson()));
  }

  static Future<User> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return User.fromJson(json.decode(pref.getString(USER_KEY)));
  }



  ///---------------------------------

  static Future<bool> setRememberMe(bool isRememberr) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(REMBER_KEY, isRememberr);
  }

  static Future<bool> getRememberMe() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(REMBER_KEY);
  }

}
