import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('المحادثات', style: TextStyle(fontFamily: 'Changa')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('لا توجد محادثات بعد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('ابدأ محادثة مع بائع أو مشتري', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor, foregroundColor: AppTheme.darkText),
              child: const Text('بدء محادثة'),
            ),
          ],
        ),
      ),
    );
  }
}
