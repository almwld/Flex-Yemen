import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/cache/local_storage_service.dart';

class ThemeManager extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeManager() {
    _loadTheme();
  }

  void _loadTheme() async {
    _isDarkMode = await LocalStorageService.isDarkMode();
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await LocalStorageService.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  void setDarkMode(bool isDark) async {
    _isDarkMode = isDark;
    await LocalStorageService.setDarkMode(_isDarkMode);
    notifyListeners();
  }

  ThemeData getTheme() {
    return _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  Color getTextColor(BuildContext context) {
    return AppTheme.getTextColor(context);
  }

  Color getBackgroundColor(BuildContext context) {
    return AppTheme.getBackgroundColor(context);
  }

  Color getCardColor(BuildContext context) {
    return AppTheme.getCardColor(context);
  }
}
