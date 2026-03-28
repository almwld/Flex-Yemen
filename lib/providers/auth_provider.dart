import 'package:flutter/material.dart';
import '../services/cache/local_storage_service.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String userType;
  final String? city;
  final double rating;
  final int followers;
  final int following;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.userType = 'customer',
    this.city,
    this.rating = 0.0,
    this.followers = 0,
    this.following = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'user_type': userType,
      'city': city,
      'rating': rating,
      'followers': followers,
      'following': following,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatarUrl: json['avatar_url'],
      userType: json['user_type'] ?? 'customer',
      city: json['city'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
    );
  }
}

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  UserModel? _userData;

  bool get isLoggedIn => _isLoggedIn;
  UserModel? get userData => _userData;
  
  // Getters للوصول السريع
  String? get userName => _userData?.fullName;
  String? get userAvatar => _userData?.avatarUrl;
  String? get userEmail => _userData?.email;
  String? get userPhone => _userData?.phone;

  AuthProvider() {
    _loadUserData();
  }

  void _loadUserData() async {
    _isLoggedIn = await LocalStorageService.isLoggedIn();
    notifyListeners();
  }

  Future<void> login(UserModel user) async {
    _isLoggedIn = true;
    _userData = user;
    await LocalStorageService.setLoggedIn(true);
    notifyListeners();
  }

  Future<void> loginAsGuest() async {
    _isLoggedIn = true;
    _userData = UserModel(
      id: 'guest_${DateTime.now().millisecondsSinceEpoch}',
      fullName: 'ضيف',
      email: 'guest@flexyemen.com',
      phone: '',
      userType: 'guest',
    );
    await LocalStorageService.setLoggedIn(true);
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
    notifyListeners();
  }
}
