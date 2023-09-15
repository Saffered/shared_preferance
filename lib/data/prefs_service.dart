import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:git_test_2/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static storageName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  static loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      "name",
    );
  }

  static Future<bool?> removeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    return null;
  }
}

class UserService {
  /// user kiritish funksiyasi
  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = jsonEncode(user);
    await prefs.setString("user", userString);
  }

  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("user");
    if (userString == null || userString.isEmpty) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(userString);
    return User.fromJson(map);
  }

  static removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }
}
