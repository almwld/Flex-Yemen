import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class dairy_products_Screen extends StatelessWidget {
  const dairy_products_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text('dairy products'), centerTitle: true, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('قسم dairy products', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 8),
            Text('قيد التطوير', style: TextStyle(fontSize: 16, color: AppTheme.getSecondaryTextColor(context))),
          ],
        ),
      ),
    );
  }
}
