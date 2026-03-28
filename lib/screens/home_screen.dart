import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/ad_card.dart';
import '../models/product_model.dart';
import 'garden_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0;

  final List<Map<String, dynamic>> _promoSlides = [
    {'title': 'عرض ترويجي 1', 'subtitle': 'خصومات تصل إلى 50%', 'color': 0xFF4CAF50},
    {'title': 'عرض ترويجي 2', 'subtitle': 'توصيل مجاني للطلبات', 'color': 0xFFFF9800},
    {'title': 'عرض ترويجي 3', 'subtitle': 'عروض رمضان', 'color': 0xFF2196F3},
  ];

  final List<Map<String, dynamic>> _mainCategories = [
    {'name': 'عقارات', 'icon': Icons.home, 'color': 0xFF4CAF50},
    {'name': 'سيارات', 'icon': Icons.directions_car, 'color': 0xFF2196F3},
    {'name': 'إلكترونيات', 'icon': Icons.devices, 'color': 0xFFFF9800},
    {'name': 'أزياء', 'icon': Icons.checkroom, 'color': 0xFFE91E63},
  ];

  final List<ProductModel> _suggestedProducts = [
    ProductModel(id: '1', title: 'منتج يمني رقم 1', description: '', price: 1500, currency: 'YER', images: ['https://picsum.photos/id/10/300/200'], category: '', sellerId: '', sellerName: '', city: 'صنعاء، اليمن', rating: 4.5, createdAt: DateTime.now()),
    ProductModel(id: '2', title: 'منتج يمني رقم 2', description: '', price: 3000, currency: 'YER', images: ['https://picsum.photos/id/20/300/200'], category: '', sellerId: '', sellerName: '', city: 'صنعاء، اليمن', rating: 4.2, createdAt: DateTime.now()),
    ProductModel(id: '3', title: 'منتج يمني رقم 3', description: '', price: 4500, currency: 'YER', images: ['https://picsum.photos/id/30/300/200'], category: '', sellerId: '', sellerName: '', city: 'صنعاء، اليمن', rating: 4.8, createdAt: DateTime.now()),
    ProductModel(id: '4', title: 'منتج يمني رقم 4', description: '', price: 6000, currency: 'YER', images: ['https://picsum.photos/id/40/300/200'], category: '', sellerId: '', sellerName: '', city: 'صنعاء، اليمن', rating: 4.3, createdAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPromoCarousel(),
            const SizedBox(height: 16),
            _buildGardenPromo(),
            const SizedBox(height: 24),
            _buildMainCategories(),
            const SizedBox(height: 24),
            _buildSuggestedProducts(),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCarousel() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _promoSlides.length,
          options: CarouselOptions(height: 180, autoPlay: true, enlargeCenterPage: true, viewportFraction: 0.9, onPageChanged: (i, _) => setState(() => _currentSlide = i)),
          itemBuilder: (context, i, _) {
            final slide = _promoSlides[i];
            return Container(
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(slide['color']), Color(slide['color']).withOpacity(0.7)], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(slide['title'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(height: 8), Text(slide['subtitle'], style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)))],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: _promoSlides.asMap().entries.map((e) => Container(width: _currentSlide == e.key ? 24 : 8, height: 8, margin: const EdgeInsets.symmetric(horizontal: 4), decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: _currentSlide == e.key ? AppTheme.goldColor : Colors.grey.withOpacity(0.3)))).toList()),
      ],
    );
  }

  Widget _buildGardenPromo() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GardenScreen())),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)]), borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [const Icon(Icons.grass, color: Colors.white, size: 20), const SizedBox(width: 8), const Text('حديقة فلكس (Flex Garden)', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))]), const SizedBox(height: 8), const Text('أزرع نقاطك واحصد خصومات مذهلة!', style: TextStyle(color: Colors.white70, fontSize: 12)), const SizedBox(height: 12), Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: const Text('استكشف الآن', style: TextStyle(color: Colors.green, fontSize: 12))),])),
            const Icon(Icons.emoji_nature, color: Colors.white, size: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('الأقسام الرئيسية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), TextButton(onPressed: () {}, child: const Text('عرض الكل', style: TextStyle(color: AppTheme.goldColor)))])),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _mainCategories.length,
            itemBuilder: (context, index) {
              final cat = _mainCategories[index];
              return Container(
                width: 80, margin: const EdgeInsets.only(left: 12),
                child: Column(children: [Container(width: 60, height: 60, decoration: BoxDecoration(color: Color(cat['color']).withOpacity(0.1), shape: BoxShape.circle), child: Icon(cat['icon'], color: Color(cat['color']), size: 28)), const SizedBox(height: 8), Text(cat['name'], style: const TextStyle(fontSize: 12), textAlign: TextAlign.center)]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('منتجات مقترحة لك', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), TextButton(onPressed: () {}, child: const Text('عرض الكل', style: TextStyle(color: AppTheme.goldColor)))])),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 12, mainAxisSpacing: 12),
          itemCount: _suggestedProducts.length,
          itemBuilder: (context, index) {
            final product = _suggestedProducts[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(color: AppTheme.getCardColor(context), borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(16)), child: CachedNetworkImage(imageUrl: product.images.first, height: 120, width: double.infinity, fit: BoxFit.cover, placeholder: (_, __) => Container(height: 120, color: Colors.grey[200]), errorWidget: (_, __, ___) => Container(height: 120, color: Colors.grey[200], child: const Icon(Icons.image_not_supported)))),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1), const SizedBox(height: 4), Text('${product.price.toStringAsFixed(0)} ر.ي', style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 2), Row(children: [const Icon(Icons.location_on, size: 10, color: Colors.grey), const SizedBox(width: 2), Expanded(child: Text(product.city ?? 'صنعاء، اليمن', style: const TextStyle(fontSize: 10, color: Colors.grey), maxLines: 1))])]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
