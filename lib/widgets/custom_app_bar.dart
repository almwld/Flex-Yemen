import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/theme_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showLogo;
  final bool showSettings;
  final bool showThemeToggle;
  final bool centerTitle;
  final Widget? leading;
  final double elevation;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.showLogo = false,
    this.showSettings = true,
    this.showThemeToggle = true,
    this.centerTitle = true,
    this.leading,
    this.elevation = 0,
    this.backgroundColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeManager = Provider.of<ThemeManager>(context);
    
    // بناء قائمة الأزرار الإضافية
    final List<Widget> actionButtons = [];
    
    if (showThemeToggle) {
      actionButtons.add(
        IconButton(
          icon: Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
            color: AppTheme.goldColor,
          ),
          tooltip: isDark ? 'الوضع النهاري' : 'الوضع الليلي',
          onPressed: () {
            themeManager.toggleTheme();
          },
        ),
      );
    }
    
    if (showSettings) {
      actionButtons.add(
        IconButton(
          icon: const Icon(Icons.settings_outlined, color: AppTheme.goldColor),
          tooltip: 'الإعدادات السريعة',
          onPressed: () {
            _showQuickSettingsSheet(context);
          },
        ),
      );
    }
    
    // إضافة الأزرار المخصصة
    if (actions != null) {
      actionButtons.addAll(actions!);
    }

    return AppBar(
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor ?? (isDark ? AppTheme.darkSurface : AppTheme.lightSurface),
      foregroundColor: AppTheme.getTextColor(context),
      leading: leading,
      bottom: bottom,
      title: showLogo
          ? _buildLogo()
          : (title != null
              ? Text(
                  title!,
                  style: const TextStyle(
                    fontFamily: 'Changa',
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null),
      actions: actionButtons.isEmpty ? null : actionButtons,
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'FLEX',
          style: TextStyle(
            color: AppTheme.goldColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Changa',
          ),
        ),
        const SizedBox(width: 4),
        Text(
          'YEMEN',
          style: TextStyle(
            color: AppTheme.goldLight,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Changa',
          ),
        ),
      ],
    );
  }

  void _showQuickSettingsSheet(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context, listen: false);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: AppTheme.getSurfaceColor(context),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // المؤشر العلوي
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // العنوان
            const Text(
              'الإعدادات السريعة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // وضع الشاشة
            _buildQuickSettingItem(
              context,
              icon: isDark ? Icons.dark_mode : Icons.light_mode,
              title: 'المظهر',
              subtitle: isDark ? 'الوضع الليلي' : 'الوضع النهاري',
              onTap: () {
                themeManager.toggleTheme();
                Navigator.pop(context);
              },
            ),
            
            // اللغة
            _buildQuickSettingItem(
              context,
              icon: Icons.language,
              title: 'اللغة',
              subtitle: 'العربية',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/language');
              },
            ),
            
            // الإشعارات
            _buildQuickSettingItem(
              context,
              icon: Icons.notifications,
              title: 'الإشعارات',
              subtitle: 'مفعلة',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notifications_settings');
              },
            ),
            
            // طرق الدفع
            _buildQuickSettingItem(
              context,
              icon: Icons.payment,
              title: 'طرق الدفع',
              subtitle: 'المحفظة، بطاقة ائتمان',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/payment_methods');
              },
            ),
            
            const Divider(height: 24),
            
            // زر الإعدادات الكاملة
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings),
                label: const Text('جميع الإعدادات'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.goldColor,
                  foregroundColor: AppTheme.darkText,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.getCardColor(context),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.goldColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.goldColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppTheme.goldColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppTheme.getSecondaryTextColor(context),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );
}

/// شريط علوي بسيط
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;

  const SimpleAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Changa',
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor ?? (isDark ? AppTheme.darkSurface : AppTheme.lightSurface),
      foregroundColor: AppTheme.getTextColor(context),
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
