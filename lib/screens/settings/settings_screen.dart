import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  final List<Map<String, dynamic>> _settingsGroups = const [
    {
      'title': 'الحساب',
      'icon': Icons.person_outline,
      'color': 0xFF4CAF50,
      'items': [
        {'title': 'معلومات الحساب', 'route': '/account_info', 'icon': Icons.info_outline},
        {'title': 'تغيير كلمة المرور', 'route': '/change_password', 'icon': Icons.lock_outline},
        {'title': 'الأجهزة المتصلة', 'route': '/connected_devices', 'icon': Icons.devices},
        {'title': 'سجل الدخول', 'route': '/login_history', 'icon': Icons.history},
      ],
    },
    {
      'title': 'الأمان والخصوصية',
      'icon': Icons.security,
      'color': 0xFF2196F3,
      'items': [
        {'title': 'المصادقة البيومترية', 'route': '/biometric_auth', 'icon': Icons.fingerprint},
        {'title': 'المصادقة الثنائية', 'route': '/two_factor', 'icon': Icons.security},
        {'title': 'إعدادات الخصوصية', 'route': '/privacy_settings', 'icon': Icons.privacy_tip},
      ],
    },
    {
      'title': 'التخصيص',
      'icon': Icons.palette,
      'color': 0xFFFF9800,
      'items': [
        {'title': 'المظهر', 'route': '/theme', 'icon': Icons.brightness_medium},
        {'title': 'اللغة', 'route': '/language', 'icon': Icons.language},
        {'title': 'الإشعارات', 'route': '/notifications_settings', 'icon': Icons.notifications},
      ],
    },
    {
      'title': 'المدفوعات',
      'icon': Icons.payment,
      'color': 0xFF9C27B0,
      'items': [
        {'title': 'طرق الدفع', 'route': '/payment_methods', 'icon': Icons.credit_card},
        {'title': 'سجل المعاملات', 'route': '/transactions', 'icon': Icons.history},
        {'title': 'التحويلات', 'route': '/transfers', 'icon': Icons.swap_horiz},
      ],
    },
    {
      'title': 'الدعم',
      'icon': Icons.support_agent,
      'color': 0xFF00BCD4,
      'items': [
        {'title': 'المساعدة والدعم', 'route': '/help_support', 'icon': Icons.help_outline},
        {'title': 'تذاكر الدعم', 'route': '/support_tickets', 'icon': Icons.confirmation_number},
        {'title': 'الأسئلة الشائعة', 'route': '/faq', 'icon': Icons.quiz},
        {'title': 'تواصل معنا', 'route': '/contact_us', 'icon': Icons.contact_mail},
      ],
    },
    {
      'title': 'حول التطبيق',
      'icon': Icons.info,
      'color': 0xFF795548,
      'items': [
        {'title': 'عن التطبيق', 'route': '/about', 'icon': Icons.info_outline},
        {'title': 'سياسة الخصوصية', 'route': '/privacy_policy', 'icon': Icons.privacy_tip},
        {'title': 'الشروط والأحكام', 'route': '/terms', 'icon': Icons.description},
        {'title': 'سجل التحديثات', 'route': '/changelog', 'icon': Icons.update},
        {'title': 'تقييم التطبيق', 'route': '/rate_app', 'icon': Icons.star},
        {'title': 'مشاركة التطبيق', 'route': '/share_app', 'icon': Icons.share},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'الإعدادات'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _settingsGroups.length,
        itemBuilder: (context, index) {
          final group = _settingsGroups[index];
          return _buildSettingsGroup(context, group, isDark);
        },
      ),
    );
  }

  Widget _buildSettingsGroup(BuildContext context, Map<String, dynamic> group, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(group['color']).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  group['icon'],
                  color: Color(group['color']),
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                group['title'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(group['color']),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.only(bottom: 16),
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: (group['items'] as List<Map<String, dynamic>>).map((item) {
              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(group['color']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    item['icon'],
                    color: Color(group['color']),
                    size: 20,
                  ),
                ),
                title: Text(
                  item['title'],
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: AppTheme.getTextColor(context),
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, item['route']);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
