import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/response/user.dart';

class UserLocalStorage {
  static const _userKey = 'user_data';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;
    return User.fromJson(jsonDecode(jsonString));
  }

  static Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_userKey);
  }
}
