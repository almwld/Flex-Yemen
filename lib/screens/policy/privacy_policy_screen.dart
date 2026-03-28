import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'سياسة الخصوصية'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('مقدمة', context),
            _buildParagraph(
              'نحن في Flex Yemen نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية. '
              'توضح هذه السياسة كيفية جمع واستخدام وحماية معلوماتك عند استخدام منصتنا.',
              context,
            ),
            
            const SizedBox(height: 16),
            _buildHeader('المعلومات التي نجمعها', context),
            _buildSubHeader('معلومات شخصية', context),
            _buildBulletPoint('الاسم الكامل', context),
            _buildBulletPoint('رقم الهاتف', context),
            _buildBulletPoint('البريد الإلكتروني', context),
            _buildBulletPoint('العنوان', context),
            
            _buildSubHeader('معلومات المعاملات', context),
            _buildBulletPoint('الطلبات والمشتريات', context),
            _buildBulletPoint('سجل الدفع', context),
            _buildBulletPoint('عناوين التوصيل', context),
            
            _buildSubHeader('معلومات تقنية', context),
            _buildBulletPoint('نوع الجهاز ونظام التشغيل', context),
            _buildBulletPoint('عنوان IP', context),
            _buildBulletPoint('بيانات الاستخدام', context),
            
            const SizedBox(height: 16),
            _buildHeader('كيف نستخدم معلوماتك', context),
            _buildBulletPoint('تشغيل وتحسين التطبيق', context),
            _buildBulletPoint('معالجة الطلبات والمدفوعات', context),
            _buildBulletPoint('إرسال الإشعارات والتحديثات', context),
            _buildBulletPoint('دعم العملاء', context),
            _buildBulletPoint('منع الاحتيال وتعزيز الأمان', context),
            
            const SizedBox(height: 16),
            _buildHeader('مشاركة المعلومات', context),
            _buildParagraph(
              'لا نقوم ببيع بياناتك الشخصية. نشارك معلوماتك فقط مع:',
              context,
            ),
            _buildBulletPoint('مزودي خدمة الدفع (لإتمام المعاملات)', context),
            _buildBulletPoint('شركات الشحن والتوصيل', context),
            _buildBulletPoint('الجهات القانونية عند الضرورة', context),
            
            const SizedBox(height: 16),
            _buildHeader('حماية البيانات', context),
            _buildBulletPoint('تشفير SSL لجميع البيانات المنقولة', context),
            _buildBulletPoint('أنظمة حماية متقدمة', context),
            _buildBulletPoint('وصول محدود للبيانات', context),
            _buildParagraph(
              'ملاحظة: لا يوجد نظام آمن بنسبة 100%، وننصحك بحماية بياناتك.', context),
            
            const SizedBox(height: 16),
            _buildHeader('حقوق المستخدم', context),
            _buildBulletPoint('الوصول إلى بياناتك الشخصية', context),
            _buildBulletPoint('تعديل بياناتك في أي وقت', context),
            _buildBulletPoint('طلب حذف حسابك', context),
            _buildBulletPoint('إيقاف الإشعارات', context),
            
            const SizedBox(height: 16),
            _buildHeader('التعديلات على السياسة', context),
            _buildParagraph(
              'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر. سيتم إعلامك بأي تغييرات جوهرية عبر التطبيق.',
              context,
            ),
            
            const SizedBox(height: 16),
            _buildHeader('التواصل', context),
            _buildParagraph(
              'للاستفسارات حول سياسة الخصوصية، يرجى التواصل معنا عبر:',
              context,
            ),
            _buildBulletPoint('البريد الإلكتروني: support@flexyemen.com', context),
            _buildBulletPoint('واتساب: 777-123-456', context),
            
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

  Widget _buildSubHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6, left: 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Changa',
          fontSize: 16,
          fontWeight: FontWeight.w600,
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
