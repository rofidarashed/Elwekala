import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
 static SharedPreferences? sharedPreferences;

 static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static saveData({required String key, required String value}) {
    return sharedPreferences?.setString(key, value);
  }

 static getData({required String key}) {
    return sharedPreferences?.getString(key);
  }
   static saveBool({required String key, required bool value}) {
    return sharedPreferences?.setBool(key, value);
  }

 static getBool({required String key}) {
    return sharedPreferences?.getBool(key);
  }
}
