// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREF_KEY_IS_USER_LOGGED_IN = "PREF_KEY_IS_USER_LOGGED_IN";
const String PREF_KEY_USER_ID = "PREF_KEY_USER_ID";

class AppPreferences {
  SharedPreferences sharedPreferences;
  AppPreferences(this.sharedPreferences);

  Future<void> setIsUserLoggedIn() async {
    sharedPreferences.setBool(PREF_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return sharedPreferences.getBool(PREF_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> saveUserId(String id) async {
    sharedPreferences.setString(PREF_KEY_USER_ID, id);
  }

  Future<String?> getUserId() async {
    return sharedPreferences.getString(PREF_KEY_USER_ID);
  }

  Future<void> logoutUser() async {
    sharedPreferences.remove(PREF_KEY_IS_USER_LOGGED_IN);
    sharedPreferences.remove(PREF_KEY_USER_ID);
  }

  Future<void> clean() async {
    sharedPreferences.clear();
  }
}
