import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static late Box _box;
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    await Hive.initFlutter();
    _box = await Hive.openBox('flex_yemen_cache');
    _initialized = true;
  }

  static Future<void> setString(String key, String value) async {
    await _box.put(key, value);
  }

  static String? getString(String key) {
    return _box.get(key) as String?;
  }

  static Future<void> setBool(String key, bool value) async {
    await _box.put(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _box.get(key) as bool? ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _box.put(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    return _box.get(key) as int? ?? defaultValue;
  }

  static Future<void> remove(String key) async {
    await _box.delete(key);
  }

  static Future<void> clear() async {
    await _box.clear();
  }

  // دوال إضافية للمشروع
  static Future<void> setDarkMode(bool isDark) async {
    await setBool('is_dark_mode', isDark);
  }

  static bool isDarkMode() {
    return getBool('is_dark_mode', defaultValue: false);
  }

  static Future<void> setLoggedIn(bool value) async {
    await setBool('is_logged_in', value);
  }

  static bool isLoggedIn() {
    return getBool('is_logged_in', defaultValue: false);
  }

  static Future<void> setUserData(Map<String, dynamic> userData) async {
    await setString('user_data', userData.toString());
  }

  static Map<String, dynamic>? getUserData() {
    final data = getString('user_data');
    if (data == null) return null;
    return {}; // سيتم تحسينه لاحقاً
  }

  static Future<void> clearUserData() async {
    await remove('user_data');
    await setBool('is_logged_in', false);
  }
}
