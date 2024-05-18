// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

const String PREF_KEY_IS_USER_LOGGED_IN = "PREF_KEY_IS_USER_LOGGED_IN";
const String PREF_KEY_USER_ID = "PREF_KEY_USER_ID";
const String PREF_KEY_NUMBERS = "PREF_KEY_NUMBERS";

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
    log("sharedPreferences cleaned");
    sharedPreferences.clear();
  }

  Future<void> addNumber(int number) async {
    List<int> currentNumbers = await loadNumbers();
    currentNumbers.add(number);
    await saveNumbers(currentNumbers);
  }

  Future<void> deleteNumber(int number) async {
    List<int> currentNumbers = await loadNumbers();
    currentNumbers.remove(number);
    await saveNumbers(currentNumbers);
  }

  Future<void> saveNumbers(List<int> numbers) async {
    List<String> numbersStringList =
        numbers.map((numbers) => numbers.toString()).toList();
    await sharedPreferences.setStringList(PREF_KEY_NUMBERS, numbersStringList);
  }

  Future<List<int>> loadNumbers() async {
    List<String>? numbersStringList =
        sharedPreferences.getStringList(PREF_KEY_NUMBERS);
    if (numbersStringList == null) {
      return [];
    }
    return numbersStringList.map((str) => int.parse(str)).toList();
  }

  Future<void> clearNumbers() async {
    await sharedPreferences.remove(PREF_KEY_NUMBERS);
  }
}
