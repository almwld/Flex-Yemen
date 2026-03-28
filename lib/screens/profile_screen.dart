import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<Map<String, dynamic>> _menuItems = const [
    {'icon': Icons.campaign_outlined, 'title': 'إعلاناتي', 'route': '/my_ads'},
    {'icon': Icons.favorite_outline, 'title': 'المفضلة', 'route': '/favorites'},
    {'icon': Icons.shopping_bag_outlined, 'title': 'طلباتي', 'route': '/my_orders'},
    {'icon': Icons.people_outline, 'title': 'المتابعون', 'route': '/followers'},
    {'icon': Icons.star_outline, 'title': 'المراجعات', 'route': '/reviews'},
    {'icon': Icons.local_florist_outlined, 'title': 'نقاطي', 'route': '/garden'},
    {'icon': Icons.settings_outlined, 'title': 'الإعدادات', 'route': '/settings'},
    {'icon': Icons.help_outline, 'title': 'المساعدة', 'route': '/help_support'},
    {'icon': Icons.share_outlined, 'title': 'دعوة الأصدقاء', 'route': '/invite_friends'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'حسابي'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User Info Card
            _buildUserInfoCard(context, authProvider),

            const SizedBox(height: 24),

            // Stats Row
            _buildStatsRow(context),

            const SizedBox(height: 24),

            // Menu Items
            _buildMenuItems(context),

            const SizedBox(height: 24),

            // Logout Button
            if (authProvider.isLoggedIn)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await authProvider.logout();
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.error.withOpacity(0.1),
                      foregroundColor: AppTheme.error,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.logout),
                    label: const Text('تسجيل الخروج'),
                  ),
                ),
              ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoCard(BuildContext context, AuthProvider authProvider) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.goldColor, AppTheme.goldLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.goldColor.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white.withOpacity(0.3),
                child: authProvider.userAvatar != null
                    ? ClipOval(child: Image.network(authProvider.userAvatar!))
                    : const Icon(Icons.person, size: 50, color: Colors.black),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: AppTheme.goldColor, size: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            authProvider.userName ?? 'ضيف',
            style: const TextStyle(
              fontFamily: 'Changa',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            authProvider.userEmail ?? 'guest@flexyemen.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          if (authProvider.isGuest) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: AppTheme.goldColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('تسجيل الدخول'),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).scale(delay: 100.ms);
  }

  Widget _buildStatsRow(BuildContext context) {
    final stats = [
      {'value': '12', 'label': 'إعلان'},
      {'value': '48', 'label': 'متابع'},
      {'value': '4.5', 'label': 'تقييم'},
      {'value': '1.2K', 'label': 'نقطة'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: stats.map((stat) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppTheme.getCardColor(context),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  stat['value']!,
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getTextColor(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stat['label']!,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.getSecondaryTextColor(context),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildMenuItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: _menuItems.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: AppTheme.getCardColor(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.goldColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(item['icon'] as IconData, color: AppTheme.goldColor),
              ),
              title: Text(item['title'] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, item['route'] as String),
            ),
          );
        }).toList(),
      ),
    ).animate().fadeIn(delay: 300.ms);
  }
}
