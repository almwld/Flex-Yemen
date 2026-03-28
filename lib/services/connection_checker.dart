import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionChecker extends ChangeNotifier {
  bool _isConnected = true;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool get isConnected => _isConnected;

  ConnectionChecker() {
    _init();
  }

  void _init() {
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final results = await Connectivity().checkConnectivity();
    _updateConnectionStatus(results);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final isConnected = results.isNotEmpty && results.first != ConnectivityResult.none;
    if (_isConnected != isConnected) {
      _isConnected = isConnected;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  String getConnectionMessage() {
    return _isConnected ? 'متصل بالإنترنت' : 'لا يوجد اتصال بالإنترنت';
  }

  Color getConnectionColor() {
    return _isConnected ? Colors.green : Colors.red;
  }
}
