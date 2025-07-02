import 'dart:convert';

import 'package:new_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorages {
  static const String _userDataKey = 'user_data_key';
  static const String _userLoggedInStatusKey = 'user_logged_in_status_key';

  //these two method is used to save and load usermodel data....
  static Future<void> saveUserData(UserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _userDataKey,
      jsonEncode(userModel.toJson(userModel)),
    );
  }

  static Future<UserModel?> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_userDataKey);

    if (data != null) {
      final decodeData = jsonDecode(data);
      final userModel = UserModel.fromJson(decodeData);
      return userModel;
    } else {
      return null;
    }
  }

  //these there method is used to set user login status true, false and to check status.
  static Future<void> setUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_userLoggedInStatusKey, true);
  }

  static Future<void> setUserLoggedOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_userLoggedInStatusKey, false);
  }

  static Future<bool> getUserLoggedStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_userLoggedInStatusKey) ?? false;
  }
}
