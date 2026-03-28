import 'package:flutter/material.dart';
import '../services/cache/local_storage_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  UserModel? _userData;

  bool get isLoggedIn => _isLoggedIn;
  UserModel? get userData => _userData;

  AuthProvider() {
    _loadUserData();
  }

  void _loadUserData() async {
    _isLoggedIn = await LocalStorageService.isLoggedIn();
    // _userData = await LocalStorageService.getUserData(); // سيتم تفعيله لاحقاً
    notifyListeners();
  }

  Future<void> login(UserModel user) async {
    _isLoggedIn = true;
    _userData = user;
    await LocalStorageService.setLoggedIn(true);
    // await LocalStorageService.setUserData(user.toJson());
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _userData = null;
    await LocalStorageService.clearUserData();
    notifyListeners();
  }

  Future<void> updateUser(UserModel user) async {
    _userData = user;
    // await LocalStorageService.setUserData(user.toJson());
    notifyListeners();
  }
}
