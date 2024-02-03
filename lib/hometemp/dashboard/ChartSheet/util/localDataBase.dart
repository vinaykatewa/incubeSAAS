import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheDataLocal {
  putData(String key, List<List<Map<String, dynamic>>> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringList = value.map((item) => jsonEncode(item)).toList();
    print('this is the key that we are saving: $key');
    print('this is the value that we are saving: ${stringList.toString()}');
    await prefs.setStringList(key, stringList);
  }

  Future<List<List<Map<String, dynamic>>>> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList(key);
    if (stringList == null) {
      print('we go null value in getData method of class CacheDataLocal');
      return [];
    }
    return stringList.map((item) {
      List<dynamic> dynamicList = jsonDecode(item);
      return dynamicList.map((i) => i as Map<String, dynamic>).toList();
    }).toList();
  }

  delData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
