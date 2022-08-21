import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CachedData {
  Future<Map?> getCachedData({required String name});
  Future<bool> setCachedData({required String name, required Map data});
  Future<bool> removeCachedData({required String name});
}

class CachedDataImpl implements CachedData {
  final SharedPreferences sharedPreferences;

  CachedDataImpl({required this.sharedPreferences});

  ///

  @override
  Future<Map?> getCachedData({required String name}) async {
    final getValue = sharedPreferences.getString(name);
    if (getValue != null) {
      return Future.value(json.decode(getValue));
    } else {
      return Future.value(null);
    }
  }

  @override
  Future<bool> setCachedData({required String name, required Map data}) {
    return sharedPreferences.setString(name, json.encode(data));
  }

  @override
  Future<bool> removeCachedData({required String name}) async {
    return await sharedPreferences.remove(name);
  }

  ///

}
