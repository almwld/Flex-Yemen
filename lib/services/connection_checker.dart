import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConnectionChecker extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  bool _isOnline = true;
  bool _isSupabaseConnected = false;
  bool _isChecking = false;

  bool get isOnline => _isOnline;
  bool get isSupabaseConnected => _isSupabaseConnected;
  bool get isChecking => _isChecking;

  ConnectionChecker() {
    _initConnectivity();
    _startMonitoring();
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      await _updateConnectionStatus(result);
    } catch (e) {
      debugPrint('Connectivity check error: $e');
    }
  }

  void _startMonitoring() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    final wasOnline = _isOnline;
    _isOnline = result != ConnectivityResult.none;

    if (_isOnline && !wasOnline) {
      // Connection restored - check Supabase
      await checkSupabaseConnection();
    }

    notifyListeners();
  }

  Future<bool> checkSupabaseConnection() async {
    _isChecking = true;
    notifyListeners();

    try {
      if (!_isOnline) {
        _isSupabaseConnected = false;
        return false;
      }

      // Try to ping Supabase
      final client = Supabase.instance.client;
      await client.from('health_check').select().limit(1).maybeSingle();
      _isSupabaseConnected = true;
    } catch (e) {
      // If health_check doesn't exist, try a different approach
      try {
        await Supabase.instance.client.auth.currentSession;
        _isSupabaseConnected = true;
      } catch (_) {
        _isSupabaseConnected = false;
      }
    } finally {
      _isChecking = false;
      notifyListeners();
    }

    return _isSupabaseConnected;
  }

  Future<void> forceCheck() async {
    final result = await _connectivity.checkConnectivity();
    await _updateConnectionStatus(result);
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}

// Connection Status Widget
class ConnectionStatusBar extends StatelessWidget {
  const ConnectionStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 0,
    );
  }
}

// Offline Indicator
class OfflineIndicator extends StatelessWidget {
  const OfflineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.red,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.white, size: 16),
          SizedBox(width: 8),
          Text(
            'لا يوجد اتصال بالإنترنت',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
