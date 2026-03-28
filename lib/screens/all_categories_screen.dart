import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  final List<String> _categories = const [
    'الصحة والجمال', 'الأجهزة المنزلية', 'المطبخ والطعام', 'الحرف والتحف',
    'مواد البناء', 'الزراعة', 'التعليم', 'السفر والسياحة', 'المزادات',
    'التبرعات', 'الكماليات', 'المعدات الثقيلة', 'البرمجيات', 'الأمن والسلامة',
    'الطيران', 'الموسيقى', 'العملات', 'السينما', 'السيارات الفاخرة',
    'العقارات التجارية', 'الإلكترونيات', 'الأثاث الفاخر', 'المجوهرات',
    'العطور والمكياج', 'الأطعمة', 'مستلزمات الأطفال', 'الحيوانات الأليفة',
    'الهدايا', 'الرياضة', 'القرطاسية', 'المعدات الصناعية', 'الأدوات الكهربائية',
    'أدوات السباكة', 'أدوات النجارة', 'أدوات الحدادة', 'الخدمات المنزلية',
    'خدمات السيارات', 'خدمات المقاولات', 'خدمات النقل', 'خدمات التدريب',
    'المعدات الطبية', 'مستحضرات التجميل', 'العناية بالشعر', 'العناية بالبشرة',
    'العطور', 'المواد الغذائية', 'المشروبات', 'الخضروات والفواكه', 'اللحوم',
    'الأسماك', 'منتجات الألبان', 'المخبوزات', 'الحلويات', 'المكسرات',
    'الأغذية المعلبة', 'التوابل', 'الأرز والحبوب', 'الزيوت', 'السكر',
    'المشروبات الساخنة', 'المشروبات الباردة', 'تجهيزات الأعراس',
    'حفلات وتخرج', 'أعياد الميلاد', 'تجهيزات الحفلات', 'المأكولات الشعبية'
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('جميع الأقسام'), centerTitle: true, elevation: 0),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.category, size: 40, color: AppTheme.goldColor),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    _categories[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
