// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static String loginSharedPreference = "LOGGEDINKEY";

  // save data

  static Future<bool> saveLoginSharedPreference(isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(loginSharedPreference, isLogin);
  }

  //fetch data

  static Future getUserSharedPrefernces() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(loginSharedPreference);
  }
}
