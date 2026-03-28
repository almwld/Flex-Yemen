import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class VendorTermsScreen extends StatelessWidget {
  const VendorTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'شروط التجار'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'التسجيل',
              '''• يجب تقديم بيانات صحيحة وكاملة
• مطلوب إثبات الهوية للتجار
• يجب توفير معلومات الاتصال الصحيحة
• نحتفظ بالحق في رفض أو إلغاء التسجيل''',
            ),
            _buildSection(
              'المنتجات',
              '''• يجب أن تكون المنتجات قانونية
• يجب أن تكون المنتجات أصلية (لا مقلدة)
• يُمنع بيع المنتجات الممنوعة أو المخالفة
• يجب تقديم وصف دقيق للمنتجات
• الصور يجب أن تكون حقيقية وواضحة''',
            ),
            _buildSection(
              'الأسعار',
              '''• الأسعار يجب أن تكون واضحة وغير مضللة
• يجب احترام الأسعار المعلنة
• يُسمح بالتفاوض ضمن حدود معقولة
• يجب الإفصاح عن أي رسوم إضافية''',
            ),
            _buildSection(
              'الطلبات والتسليم',
              '''• الالتزام بالتسليم في الوقت المحدد
• التواصل مع العميل بشكل مهني
• تغليف المنتجات بشكل آمن
• إبلاغ العميل بأي تأخير مسبقاً''',
            ),
            _buildSection(
              'العمولات',
              '''• نسبة عمولة على كل عملية بيع
• يتم خصم العمولة تلقائياً
• العمولة قابلة للتغيير مع إشعار مسبق
• رسوم إضافية على الخدمات المميزة''',
            ),
            _buildSection(
              'التقييمات',
              '''• التاجر مسؤول عن تقييمه
• التقييم يؤثر على ظهور المتجر
• يُمنع التلاعب بالتقييمات
• يمكن الرد على التقييمات السلبية''',
            ),
            _buildSection(
              'المخالفات والعقوبات',
              '''يُمنع:
• الغش أو الخداع
• بيع منتجات ممنوعة
• التلاعب بالأسعار
• سوء التعامل مع العملاء
• عدم الالتزام بالتسليم

العقوبات:
• إنذار أولي
• تعليق مؤقت
• خصم من العمولة
• حظر نهائي''',
            ),
            _buildSection(
              'سحب الأرباح',
              '''• السحب عبر المحفظة الإلكترونية
• الحد الأدنى للسحب: 10,000 ر.ي
• مدة المعالجة: 1-3 أيام عمل
• رسوم سحب قد تطبق''',
            ),
            _buildSection(
              'إلغاء العضوية',
              'نحتفظ بالحق في إلغاء عضوية التاجر في حال:
• انتهاك الشروط المتكرر
• تقييمات سلبية متكررة
• عدم النشاط لفترة طويلة',
            ),
            _buildSection(
              'اتصل بنا',
              'للاستفسارات حول شروط التجار: vendors@flexyemen.com',
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
