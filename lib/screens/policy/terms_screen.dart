import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'الشروط والأحكام'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('قبول الشروط', context),
            _buildParagraph(
              'باستخدامك لمنصة Flex Yemen، فإنك توافق على الالتزام بهذه الشروط والأحكام. '
              'إذا كنت لا توافق على هذه الشروط، يرجى عدم استخدام المنصة.',
              context,
            ),
            
            const SizedBox(height: 16),
            _buildHeader('الاستخدام المسموح به', context),
            _buildBulletPoint('استخدام المنصة للأغراض القانونية فقط', context),
            _buildBulletPoint('الالتزام بالقوانين واللوائح المحلية', context),
            _buildBulletPoint('احترام حقوق الملكية الفكرية', context),
            
            const SizedBox(height: 16),
            _buildHeader('الاستخدام المحظور', context),
            _buildBulletPoint('نشر محتوى غير قانوني أو ضار', context),
            _buildBulletPoint('الاحتيال أو انتحال الشخصية', context),
            _buildBulletPoint('التلاعب بالأسعار أو التقييمات', context),
            _buildBulletPoint('استخدام المنصة لنقل البرامج الضارة', context),
            
            const SizedBox(height: 16),
            _buildHeader('الحسابات', context),
            _buildBulletPoint('تقديم معلومات صحيحة وكاملة عند التسجيل', context),
            _buildBulletPoint('المسؤولية الكاملة عن الحفاظ على سرية حسابك', context),
            _buildBulletPoint('إخطارنا فوراً بأي استخدام غير مصرح به', context),
            _buildBulletPoint('نحتفظ بالحق في تعليق أو إنهاء أي حساب', context),
            
            const SizedBox(height: 16),
            _buildHeader('الطلبات والمدفوعات', context),
            _buildBulletPoint('الطلب ملزم بعد تأكيد الدفع', context),
            _buildBulletPoint('سياسة الإلغاء والاسترجاع حسب نوع المنتج', context),
            _buildBulletPoint('الأسعار قابلة للتغيير دون إشعار مسبق', context),
            _buildBulletPoint('العروض الترويجية محدودة المدة', context),
            
            const SizedBox(height: 16),
            _buildHeader('المسؤولية', context),
            _buildParagraph(
              'Flex Yemen هي منصة وسيط بين البائعين والمشترين. نحن غير مسؤولين عن جودة المنتجات أو تأخير التوصيل من قبل البائعين.',
              context,
            ),
            
            const SizedBox(height: 16),
            _buildHeader('الملكية الفكرية', context),
            _buildBulletPoint('جميع حقوق الملكية الفكرية للمنصة محفوظة', context),
            _buildBulletPoint('لا يجوز نسخ أو تعديل محتوى المنصة دون إذن', context),
            
            const SizedBox(height: 16),
            _buildHeader('التعديلات على الشروط', context),
            _buildParagraph(
              'نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إعلامك بأي تغييرات جوهرية عبر التطبيق.',
              context,
            ),
            
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.goldColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
              ),
              child: Text(
                'آخر تحديث: 1 مارس 2026',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 12,
                  color: AppTheme.getSecondaryTextColor(context),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Changa',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppTheme.getTextColor(context),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Changa',
          fontSize: 14,
          height: 1.5,
          color: AppTheme.getSecondaryTextColor(context),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.goldColor,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 14,
                color: AppTheme.getSecondaryTextColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
