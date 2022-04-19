import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static  SharedPreferences? sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putData({
    required String key,
    required bool value,
  })async
  {
   // print(value);
    return await sharedPreferences?.setBool(key,value);
  }

  static Future <dynamic> getData({
    required String key,
  })async
  {
    return await sharedPreferences?.get(key);
  }
  ///////////////////////////

  ////////////////////////////////////
  static Future<dynamic?> saveData({
    required String key,
    required dynamic value,
     bool? admin,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);

    return await sharedPreferences!.setDouble(key, value);
  }
  /////////////////////////////////////////
  static Future<bool> removeData({
    required String key,
  })async
  {
    return await sharedPreferences!.remove(key);
  }
 static reset () async {
    await sharedPreferences!.clear();
  }


}