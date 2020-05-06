import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized }

class StorageService with ChangeNotifier {
  static StorageService _instance;
  static SharedPreferences _sharedPreferences;

  static Future<StorageService> getInstance() async {
    if (_instance == null) {
      _instance = StorageService();
    }
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }
}
