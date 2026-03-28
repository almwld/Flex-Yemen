import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'all_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'إلكترونيات', 'icon': Icons.devices, 'color': 0xFF2196F3, 'count': '1,234'},
    {'name': 'سيارات', 'icon': Icons.directions_car, 'color': 0xFF4CAF50, 'count': '567'},
    {'name': 'عقارات', 'icon': Icons.home, 'color': 0xFFFF9800, 'count': '345'},
    {'name': 'أثاث', 'icon': Icons.chair, 'color': 0xFF795548, 'count': '456'},
    {'name': 'ملابس', 'icon': Icons.checkroom, 'color': 0xFFE91E63, 'count': '789'},
    {'name': 'مطاعم', 'icon': Icons.restaurant, 'color': 0xFF9C27B0, 'count': '234'},
    {'name': 'خدمات', 'icon': Icons.build, 'color': 0xFF00BCD4, 'count': '123'},
    {'name': 'ألعاب', 'icon': Icons.sports_esports, 'color': 0xFFE74C3C, 'count': '89'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('الفئات'), centerTitle: true, elevation: 0),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.9, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllCategoriesScreen())),
            child: Container(
              decoration: BoxDecoration(color: isDark ? AppTheme.darkCard : AppTheme.lightCard, borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(cat['color']).withOpacity(0.3))),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(width: 60, height: 60, decoration: BoxDecoration(color: Color(cat['color']).withOpacity(0.2), shape: BoxShape.circle), child: Icon(cat['icon'], color: Color(cat['color']), size: 28)),
                const SizedBox(height: 8),
                Text(cat['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('${cat['count']} منتج', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ]),
            ),
          );
        },
      ),
    );
  }
}
