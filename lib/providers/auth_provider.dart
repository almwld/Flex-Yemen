import 'package:flutter/material.dart';
import '../services/cache/local_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isGuest = false;
  Map<String, dynamic>? _userData;

  bool get isLoggedIn => _isLoggedIn;
  bool get isGuest => _isGuest;
  Map<String, dynamic>? get userData => _userData;
  String? get userName => _userData?['name'];
  String? get userEmail => _userData?['email'];
  String? get userAvatar => _userData?['avatar'];

  AuthProvider() {
    _loadAuthState();
  }

  void _loadAuthState() {
    _isLoggedIn = LocalStorageService.isLoggedIn();
    _userData = LocalStorageService.getUserData();
    _isGuest = LocalStorageService.getBool('is_guest') ?? false;
    notifyListeners();
  }

  Future<void> login(Map<String, dynamic> userData, {bool isGuest = false}) async {
    _isLoggedIn = true;
    _isGuest = isGuest;
    _userData = userData;

    await LocalStorageService.saveUserData(userData);
    await LocalStorageService.setBool('is_guest', isGuest);

    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _isGuest = false;
    _userData = null;

    await LocalStorageService.clearUserData();
    await LocalStorageService.setBool('is_guest', false);

    notifyListeners();
  }

  Future<void> updateUserData(Map<String, dynamic> userData) async {
    _userData = {...?_userData, ...userData};
    await LocalStorageService.saveUserData(_userData!);
    notifyListeners();
  }

  Future<void> loginAsGuest() async {
    final guestData = {
      'name': 'ضيف',
      'email': 'guest@flexyemen.com',
      'avatar': null,
      'is_guest': true,
    };
    await login(guestData, isGuest: true);
  }

  bool get canAccessFullFeatures => _isLoggedIn && !_isGuest;
}
