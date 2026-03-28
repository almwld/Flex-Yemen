import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class SecurityPolicyScreen extends StatelessWidget {
  const SecurityPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'سياسة الأمان'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'حماية الحساب',
              '''• المستخدم مسؤول عن الحفاظ على سرية كلمة المرور
• يُمنع مشاركة معلومات تسجيل الدخول مع الآخرين
• يجب استخدام كلمات مرور قوية وفريدة
• يُنصح بتفعيل المصادقة الثنائية
• يجب تسجيل الخروج من الأجهزة العامة''',
            ),
            _buildSection(
              'المدفوعات الآمنة',
              '''• نستخدم قنوات دفع آمنة وموثوقة
• لا يتم تخزين بيانات البطاقات الائتمانية على خوادمنا
• جميع المعاملات مشفرة باستخدام SSL/TLS
• نتعامل مع مزودي دفع معتمدين ومرخصين''',
            ),
            _buildSection(
              'مكافحة الاحتيال',
              '''• مراقبة مستمرة للعمليات المشبوهة
• إيقاف الحسابات المشتبه في ارتكابها احتيالاً
• التحقق من هوية المستخدمين
• نظام تقييم للبائعين والمشترين''',
            ),
            _buildSection(
              'الإبلاغ عن المشاكل',
              '''يمكنك الإبلاغ عن:
• عمليات مشبوهة أو غير مصرح بها
• حسابات مزيفة أو مخادعة
• منتجات مقلدة أو غير أصلية
• سلوك غير لائق من المستخدمين

للإبلاغ: security@flexyemen.com''',
            ),
            _buildSection(
              'الإجراءات الأمنية',
              '''• تحديثات أمنية منتظمة للتطبيق
• فحص دوري للثغرات الأمنية
• نسخ احتياطي يومي للبيانات
• فرق أمن متخصص على مدار الساعة''',
            ),
            _buildSection(
              'نصائح الأمان',
              '''• لا تنقر على روابط مشبوهة
• تحقق من هوية البائع قبل الشراء
• استخدم شبكات Wi-Fi آمنة فقط
• حافظ على تحديث التطبيق
• لا تشارك رمز التحقق مع أحد''',
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.info.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.info.withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: AppTheme.info),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'في حال اكتشاف أي نشاط مشبوه، يرجى الإبلاغ فوراً.',
                      style: TextStyle(color: AppTheme.info),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'آخر تحديث: مارس 2026',
              style: TextStyle(
                color: AppTheme.getSecondaryTextColor(context),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Changa',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.goldColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
