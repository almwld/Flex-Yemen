import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SecurityPolicyScreen extends StatelessWidget {
  const SecurityPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'سياسة الأمان'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('حماية الحساب', context),
            _buildBulletPoint('استخدم كلمة مرور قوية وفريدة', context),
            _buildBulletPoint('لا تشارك معلومات حسابك مع أي شخص', context),
            _buildBulletPoint('قم بتسجيل الخروج بعد الاستخدام على الأجهزة المشتركة', context),
            _buildBulletPoint('فعّل المصادقة الثنائية لحماية إضافية', context),
            
            const SizedBox(height: 16),
            _buildHeader('المدفوعات والمعاملات المالية', context),
            _buildBulletPoint('جميع المعاملات المالية مشفرة بتقنية SSL', context),
            _buildBulletPoint('لا يتم تخزين بيانات بطاقات الائتمان', context),
            _buildBulletPoint('قنوات دفع آمنة ومعتمدة', context),
            _buildBulletPoint('إشعارات فورية لأي عملية دفع', context),
            
            const SizedBox(height: 16),
            _buildHeader('مكافحة الاحتيال', context),
            _buildBulletPoint('مراقبة مستمرة للعمليات المشبوهة', context),
            _buildBulletPoint('إيقاف الحسابات المشبوهة مؤقتاً', context),
            _buildBulletPoint('التحقق من الهوية للتجار', context),
            _buildBulletPoint('توثيق عمليات التحويل الكبيرة', context),
            
            const SizedBox(height: 16),
            _buildHeader('حماية البيانات', context),
            _buildBulletPoint('تشفير البيانات الحساسة', context),
            _buildBulletPoint('نسخ احتياطي منتظم للبيانات', context),
            _buildBulletPoint('وصول محدود للموظفين', context),
            _buildBulletPoint('مراجعات أمنية دورية', context),
            
            const SizedBox(height: 16),
            _buildHeader('الإبلاغ عن المشكلات', context),
            _buildBulletPoint('يمكنك الإبلاغ عن أي نشاط مشبوه', context),
            _buildBulletPoint('الإبلاغ عن حسابات مزيفة', context),
            _buildBulletPoint('الإبلاغ عن منتجات مخالفة', context),
            _buildBulletPoint('قناة اتصال آمنة للشكاوى', context),
            
            const SizedBox(height: 16),
            _buildHeader('نصائح أمنية للمستخدمين', context),
            _buildBulletPoint('لا تفتح روابط مشبوهة', context),
            _buildBulletPoint('تأكد من عنوان الموقع قبل إدخال بياناتك', context),
            _buildBulletPoint('استخدم اتصال إنترنت آمن', context),
            _buildBulletPoint('حدث تطبيقك باستمرار', context),
            
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.goldColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
              ),
              child: Text(
                'للإبلاغ عن ثغرة أمنية: security@flexyemen.com',
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

  Widget _buildBulletPoint(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16),
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
