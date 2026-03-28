import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../providers/theme_manager.dart';
import '../../widgets/simple_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeManager = context.watch<ThemeManager>();

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'الإعدادات'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section
            _buildSectionTitle('الحساب'),
            _buildSettingsGroup([
              _buildSettingItem(
                icon: Icons.person_outline,
                title: 'معلومات الحساب',
                onTap: () => Navigator.pushNamed(context, '/account_info'),
              ),
              _buildSettingItem(
                icon: Icons.lock_outline,
                title: 'تغيير كلمة المرور',
                onTap: () => Navigator.pushNamed(context, '/change_password'),
              ),
              _buildSettingItem(
                icon: Icons.devices_outlined,
                title: 'الأجهزة المتصلة',
                onTap: () => Navigator.pushNamed(context, '/connected_devices'),
              ),
              _buildSettingItem(
                icon: Icons.history_outlined,
                title: 'سجل الدخول',
                onTap: () => Navigator.pushNamed(context, '/login_history'),
              ),
            ]),

            // Security Section
            _buildSectionTitle('الأمان والخصوصية'),
            _buildSettingsGroup([
              _buildSettingItem(
                icon: Icons.fingerprint,
                title: 'المصادقة البيومترية',
                onTap: () => Navigator.pushNamed(context, '/biometric_auth'),
              ),
              _buildSettingItem(
                icon: Icons.security_outlined,
                title: 'المصادقة الثنائية',
                onTap: () => Navigator.pushNamed(context, '/two_factor'),
              ),
              _buildSettingItem(
                icon: Icons.privacy_tip_outlined,
                title: 'إعدادات الخصوصية',
                onTap: () => Navigator.pushNamed(context, '/privacy_settings'),
              ),
            ]),

            // Customization Section
            _buildSectionTitle('التخصيص'),
            _buildSettingsGroup([
              _buildSettingItem(
                icon: isDark ? Icons.dark_mode : Icons.light_mode,
                title: 'المظهر',
                subtitle: isDark ? 'وضع ليلي' : 'وضع نهاري',
                trailing: Switch(
                  value: themeManager.isDarkMode,
                  onChanged: (value) => themeManager.toggleTheme(),
                  activeColor: AppTheme.goldColor,
                ),
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.language_outlined,
                title: 'اللغة',
                subtitle: 'العربية',
                onTap: () => Navigator.pushNamed(context, '/language'),
              ),
              _buildSettingItem(
                icon: Icons.notifications_outlined,
                title: 'الإشعارات',
                onTap: () => Navigator.pushNamed(context, '/notifications_settings'),
              ),
            ]),

            // Payments Section
            _buildSectionTitle('المدفوعات'),
            _buildSettingsGroup([
              _buildSettingItem(
                icon: Icons.payment_outlined,
                title: 'طرق الدفع',
                onTap: () => Navigator.pushNamed(context, '/payment_methods'),
              ),
              _buildSettingItem(
                icon: Icons.receipt_long_outlined,
                title: 'سجل المعاملات',
                onTap: () => Navigator.pushNamed(context, '/transactions'),
              ),
              _buildSettingItem(
                icon: Icons.swap_horiz_outlined,
                title: 'التحويلات',
                onTap: () => Navigator.pushNamed(context, '/transfer'),
              ),
            ]),

            // Support Section
            _buildSectionTitle('الدعم'),
            _buildSettingsGroup([
              _buildSettingItem(
                icon: Icons.help_outline,
                title: 'المساعدة والدعم',
                onTap: () => Navigator.pushNamed(context, '/help_support'),
              ),
              _buildSettingItem(
                icon: Icons.confirmation_number_outlined,
                title: 'تذاكر الدعم',
                onTap: () => Navigator.pushNamed(context, '/support_tickets'),
              ),
              _buildSettingItem(
                icon: Icons.question_answer_outlined,
                title: 'الأسئلة الشائعة',
                onTap: () => Navigator.pushNamed(context, '/faq'),
              ),
              _buildSettingItem(
                icon: Icons.contact_support_outlined,
                title: 'تواصل معنا',
                onTap: () => Navigator.pushNamed(context, '/contact_us'),
              ),
            ]),

            // About Section
            _buildSectionTitle('حول التطبيق'),
            _buildSettingsGroup([
              _buildSettingItem(
                icon: Icons.info_outline,
                title: 'عن التطبيق',
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              _buildSettingItem(
                icon: Icons.policy_outlined,
                title: 'سياسة الخصوصية',
                onTap: () => Navigator.pushNamed(context, '/privacy_policy'),
              ),
              _buildSettingItem(
                icon: Icons.gavel_outlined,
                title: 'الشروط والأحكام',
                onTap: () => Navigator.pushNamed(context, '/terms'),
              ),
              _buildSettingItem(
                icon: Icons.update_outlined,
                title: 'سجل التحديثات',
                onTap: () => Navigator.pushNamed(context, '/changelog'),
              ),
              _buildSettingItem(
                icon: Icons.star_outline,
                title: 'تقييم التطبيق',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.share_outlined,
                title: 'مشاركة التطبيق',
                onTap: () {},
              ),
            ]),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Changa',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppTheme.goldColor,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.getCardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.goldColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.goldColor, size: 20),
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
