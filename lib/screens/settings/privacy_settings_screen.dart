import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'إعدادات الخصوصية'),
      body: const Center(child: Text('إعدادات الخصوصية - قيد التطوير')),
    );
  }
}
