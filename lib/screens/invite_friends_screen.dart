import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'دعوة الأصدقاء'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people, size: 80, color: AppTheme.goldColor),
            const SizedBox(height: 20),
            const Text('ادعُ أصدقاءك واحصل على مكافآت', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('لكل صديق يسجل عبر رابطك، ستحصل على 100 نقطة', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => Share.share('انضم إلى Flex Yemen عبر الرابط: https://flexyemen.app'),
              icon: const Icon(Icons.share),
              label: const Text('مشاركة الرابط'),
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
