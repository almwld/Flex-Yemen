import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'الشروط والأحكام'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'قبول الشروط',
              'باستخدامك لتطبيق Flex Yemen، فإنك توافق على هذه الشروط والأحكام. إذا كنت لا توافق، يرجى عدم استخدام التطبيق.',
            ),
            _buildSection(
              'الاستخدام المسموح',
              '''يُسمح باستخدام التطبيق للأغراض التالية:
• البيع والشراء القانوني
• التواصل بين المستخدمين
• البحث عن المنتجات والخدمات

يُمنع استخدام التطبيق لـ:
• أي نشاط غير قانوني
• الاحتيال أو الخداع
• نشر محتوى مسيء أو غير لائق
• انتهاك حقوق الملكية الفكرية''',
            ),
            _buildSection(
              'الحسابات',
              '''• يجب تقديم معلومات صحيحة ودقيقة
• أنت مسؤول عن الحفاظ على سرية كلمة المرور
• يجب إعلامنا فوراً بأي استخدام غير مصرح به
• نحتفظ بالحق في إيقاف أو حذف الحسابات المخالفة''',
            ),
            _buildSection(
              'الطلبات والمدفوعات',
              '''• الطلب ملزم بعد التأكيد
• الأسعار قابلة للتغيير دون إشعار مسبق
• يجب الدفع خلال الوقت المحدد
• الإلغاء يخضع لسياسة الإلغاء الخاصة بنا''',
            ),
            _buildSection(
              'الأسعار والعروض',
              '''• جميع الأسعار بالريال اليمني
• العروض محدودة الوقت والكمية
• نحتفظ بالحق في تعديل الأسعار
• الأسعار لا تشمل رسوم الشحن إلا إذا ذُكر خلاف ذلك''',
            ),
            _buildSection(
              'المسؤولية',
              '''• Flex Yemen هو وسيط فقط بين البائع والمشتري
• لا نتحمل مسؤولية جودة المنتجات
• لا نتحمل مسؤولية التأخير في الشحن
• المستخدم مسؤول عن التحقق من المنتجات قبل الشراء''',
            ),
            _buildSection(
              'الملكية الفكرية',
              '''• جميع المحتويات محمية بحقوق النشر
• لا يجب نسخ أو توزيع المحتوى بدون إذن
• العلامات التجارية ملكية خاصة''',
            ),
            _buildSection(
              'التعديلات',
              'نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إعلام المستخدمين بالتغييرات الجوهرية.',
            ),
            _buildSection(
              'القانون الساري',
              'تخضع هذه الشروط للقوانين اليمنية. أي نزاع يُحل في محاكم صنعاء.',
            ),
            _buildSection(
              'اتصل بنا',
              'لأي استفسارات حول الشروط والأحكام: legal@flexyemen.com',
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
