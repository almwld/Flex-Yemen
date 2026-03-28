import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class VendorTermsScreen extends StatelessWidget {
  const VendorTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'شروط التجار'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('شروط التسجيل كتاجر', context),
            _buildBulletPoint('بيانات صحيحة وكاملة', context),
            _buildBulletPoint('إثبات الهوية والهوية التجارية', context),
            
            const SizedBox(height: 16),
            _buildHeader('المنتجات المسموح بها', context),
            _buildBulletPoint('منتجات قانونية ومطابقة للقوانين اليمنية', context),
            _buildBulletPoint('منتجات أصلية غير مقلدة', context),
            _buildBulletPoint('منتجات غير مخالفة للآداب العامة', context),
            
            const SizedBox(height: 16),
            _buildHeader('الأسعار والتسعير', context),
            _buildBulletPoint('تحديد أسعار واضحة وصريحة', context),
            _buildBulletPoint('عدم التلاعب بالأسعار أو تضليل العملاء', context),
            _buildBulletPoint('الالتزام بالأسعار المعلنة', context),
            
            const SizedBox(height: 16),
            _buildHeader('الطلبات والتسليم', context),
            _buildBulletPoint('الالتزام بتسليم المنتجات في الوقت المحدد', context),
            _buildBulletPoint('تحديث حالة الطلبات باستمرار', context),
            _buildBulletPoint('معالجة الطلبات خلال 24 ساعة', context),
            
            const SizedBox(height: 16),
            _buildHeader('العمولات والرسوم', context),
            _buildBulletPoint('نسبة عمولة 5% على كل عملية بيع ناجحة', context),
            _buildBulletPoint('رسوم إضافية على الخدمات المميزة', context),
            _buildBulletPoint('سحب الأرباح عبر المحفظة الإلكترونية', context),
            
            const SizedBox(height: 16),
            _buildHeader('التقييمات والسمعة', context),
            _buildBulletPoint('التاجر مسؤول عن سمعته وتقييماته', context),
            _buildBulletPoint('التقييمات تؤثر على ظهور المنتجات', context),
            _buildBulletPoint('حق الرد على التقييمات السلبية', context),
            
            const SizedBox(height: 16),
            _buildHeader('المخالفات والعقوبات', context),
            _buildBulletPoint('انتهاك الشروط المتكرر يؤدي إلى إيقاف الحساب', context),
            _buildBulletPoint('تقييمات سلبية متكررة تؤدي إلى إنذار', context),
            _buildBulletPoint('عدم النشاط لفترة طويلة يؤدي إلى إيقاف مؤقت', context),
            
            const SizedBox(height: 16),
            _buildHeader('سحب الأرباح', context),
            _buildBulletPoint('الحد الأدنى للسحب 10,000 ريال', context),
            _buildBulletPoint('مدة معالجة طلبات السحب 3-5 أيام عمل', context),
            _buildBulletPoint('تحويل الأرباح إلى المحفظة الإلكترونية', context),
            
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

  Widget _buildBulletPoint(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.goldColor,
              fontWeight: FontWeight.bold,
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
