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
}
