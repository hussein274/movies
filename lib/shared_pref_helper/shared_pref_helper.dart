import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/model/response/user_data/register_response.dart';
@injectable
class SharedPrefHelper {

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<void> saveUserData(UserData userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userData", jsonEncode(userData.toJson()));
  }


  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<UserData?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString("userData");
    if (userData == null) {
      return null;
    }
    return UserData.fromJson(jsonDecode(userData));
  }
}
