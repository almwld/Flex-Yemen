import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'سياسة الخصوصية'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'مقدمة',
              'نحن في Flex Yemen نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية. توضح هذه السياسة كيفية جمعنا واستخدامنا وحمايتنا لمعلوماتك.',
            ),
            _buildSection(
              'المعلومات التي نجمعها',
              '''• المعلومات الشخصية: الاسم، رقم الهاتف، البريد الإلكتروني، العنوان
• معلومات المعاملات: الطلبات، عمليات الشراء، سجل الدفع
• المعلومات التقنية: نوع الجهاز، نظام التشغيل، عنوان IP
• معلومات الموقع: الموقع الجغرافي لتحسين الخدمة''',
            ),
            _buildSection(
              'استخدام المعلومات',
              '''نستخدم معلوماتك من أجل:
• تشغيل التطبيق وتقديم الخدمات
• معالجة الطلبات والمدفوعات
• إرسال الإشعارات والتحديثات
• تقديم دعم العملاء
• تحسين تجربة المستخدم''',
            ),
            _buildSection(
              'مشاركة البيانات',
              '''• لا نبيع بياناتك لأي طرف ثالث
• نشارك فقط مع مزودي الدفع وشركات الشحن
• قد نشارك مع السلطات إذا تطلب القانون ذلك''',
            ),
            _buildSection(
              'حماية البيانات',
              '''• نستخدم تشفير SSL لحماية البيانات
• أنظمة حماية متقدمة ضد الاختراق
• تحديثات أمنية منتظمة
• فريق أمن متخصص''',
            ),
            _buildSection(
              'حقوق المستخدم',
              '''• الحق في الوصول إلى بياناتك
• الحق في تعديل معلوماتك
• الحق في حذف حسابك
• الحق في إيقاف الإشعارات
• الحق في الاعتراض على معالجة البيانات''',
            ),
            _buildSection(
              'ملفات تعريف الارتباط',
              'نستخدم ملفات تعريف الارتباط لتحسين تجربتك. يمكنك تعطيلها من إعدادات المتصفح.',
            ),
            _buildSection(
              'التغييرات على السياسة',
              'قد نقوم بتحديث هذه السياسة من وقت لآخر. سيتم إعلامك بأي تغييرات جوهرية.',
            ),
            _buildSection(
              'اتصل بنا',
              'لأي استفسارات حول سياسة الخصوصية، يرجى التواصل معنا على: privacy@flexyemen.com',
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
