import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'all_ads_screen.dart';
import 'map/interactive_map_screen.dart';
import 'wallet/wallet_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  bool _isFabExpanded = false;

  final List<Widget> _screens = const [
    HomeScreen(),
    AllAdsScreen(),
    InteractiveMapScreen(),
    SizedBox(), // Placeholder for FAB
    WalletScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      // FAB clicked
      _showQuickActionsSheet();
      return;
    }

    // Adjust index for screens after FAB
    final screenIndex = index > 3 ? index - 1 : index;

    setState(() {
      _currentIndex = screenIndex;
    });
  }

  void _showQuickActionsSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppTheme.getSurfaceColor(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.getDividerColor(context),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'إجراءات سريعة',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.getTextColor(context),
              ),
            ),
            const SizedBox(height: 24),
            _buildQuickActionItem(
              icon: Icons.add_circle_outline,
              title: 'إضافة إعلان',
              subtitle: 'أضف إعلاناً جديداً للبيع',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add_ad');
              },
            ),
            _buildQuickActionItem(
              icon: Icons.shopping_bag_outlined,
              title: 'إضافة منتج',
              subtitle: 'أضف منتجاً جديداً للمتجر',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/seller_products');
              },
            ),
            _buildQuickActionItem(
              icon: Icons.handyman_outlined,
              title: 'طلب خدمة',
              subtitle: 'اطلب خدمة من مزودي الخدمات',
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context, '/request_service');
              },
            ),
            _buildQuickActionItem(
              icon: Icons.account_balance_wallet_outlined,
              title: 'استلام حوالة',
              subtitle: 'استلم حوالة مالية',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/receive_transfer');
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppTheme.goldColor, AppTheme.goldLight],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.getTextColor(context),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: AppTheme.getSecondaryTextColor(context),
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          const AllAdsScreen(),
          const InteractiveMapScreen(),
          const SizedBox(), // Placeholder
          const WalletScreen(),
          const ChatScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_outlined, 'الرئيسية', 0),
                _buildNavItem(Icons.store_outlined, 'المتجر', 1),
                _buildNavItem(Icons.map_outlined, 'الخريطة', 2),
                // Golden FAB
                GestureDetector(
                  onTap: _showQuickActionsSheet,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.goldColor, AppTheme.goldLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.goldColor.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.05, 1.05),
                      duration: 1.seconds,
                      curve: Curves.easeInOut,
                    ),
                _buildNavItem(Icons.account_balance_wallet_outlined, 'المحفظة', 4),
                _buildNavItem(Icons.chat_bubble_outline, 'الدردشة', 5),
                _buildNavItem(Icons.person_outline, 'حسابي', 6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.goldColor : (isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppTheme.goldColor : (isDark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
