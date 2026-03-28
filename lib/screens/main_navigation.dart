import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'all_ads_screen.dart';
import 'map/interactive_map_screen.dart';
import 'wallet/wallet_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import 'add_ad_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AllAdsScreen(),
    const InteractiveMapScreen(),
    const WalletScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      _showQuickActionsSheet();
      return;
    }
    int actualIndex = index > 3 ? index - 1 : index;
    setState(() => _currentIndex = actualIndex);
  }

  void _showQuickActionsSheet() {
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _animationController.reverse();
    });
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      backgroundColor: AppTheme.getSurfaceColor(context),
      builder: (context) => _buildQuickActionsSheet(context),
    );
  }

  Widget _buildQuickActionsSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, margin: const EdgeInsets.only(bottom: 20), decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          const Text('إجراءات سريعة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildActionItem(context, Icons.add_circle_outline, 'إضافة إعلان', 'انشر إعلاناً جديداً', AppTheme.goldColor, () { Navigator.pop(context); Navigator.pushNamed(context, '/add_ad'); }),
          _buildActionItem(context, Icons.shopping_bag_outlined, 'إضافة منتج', 'أضف منتجاً جديداً للبيع', Colors.green, () { Navigator.pop(context); Navigator.pushNamed(context, '/add_product'); }),
          _buildActionItem(context, Icons.build_outlined, 'طلب خدمة', 'اطلب خدمة معينة', Colors.blue, () { Navigator.pop(context); Navigator.pushNamed(context, '/request_service'); }),
          _buildActionItem(context, Icons.download_outlined, 'استلام حوالة', 'استلم حوالة مالية', Colors.purple, () { Navigator.pop(context); Navigator.pushNamed(context, '/receive_transfer'); }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String title, String subtitle, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(16), border: Border.all(color: color.withOpacity(0.3))),
        child: Row(
          children: [
            Container(width: 50, height: 50, decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color, size: 28)),
            const SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600]))])),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5))]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem('home', 'الرئيسية', 0),
                _buildNavItem('store', 'المتجر', 1),
                _buildNavItem('location', 'الخريطة', 2),
                _buildCenterButton(),
                _buildNavItem('wallet', 'المحفظة', 4),
                _buildNavItem('chat', 'الدردشة', 5),
                _buildNavItem('profile', 'حسابي', 6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconName, String label, int index) {
    final bool isSelected = _currentIndex == (index > 3 ? index - 1 : index);
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: isSelected ? AppTheme.goldColor.withOpacity(0.1) : Colors.transparent, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/svg/$iconName.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(isSelected ? AppTheme.goldColor : AppTheme.getSecondaryTextColor(context), BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontFamily: 'Changa', fontSize: 11, color: isSelected ? AppTheme.goldColor : AppTheme.getSecondaryTextColor(context), fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return GestureDetector(
      onTap: () => _onItemTapped(3),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 56, height: 56,
            decoration: BoxDecoration(gradient: AppTheme.goldGradient, shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.goldColor.withOpacity(0.4), blurRadius: 12, offset: const Offset(0, 4))]),
            child: const Icon(Icons.add, color: AppTheme.darkText, size: 32),
          ),
        ),
      ),
    );
  }
}
