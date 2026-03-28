import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';

class AdCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const AdCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: product.images.isNotEmpty ? product.images.first : 'https://via.placeholder.com/300x200',
                height: 150, width: double.infinity, fit: BoxFit.cover,
                placeholder: (_, __) => Container(height: 150, color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface, child: const Center(child: CircularProgressIndicator())),
                errorWidget: (_, __, ___) => Container(height: 150, color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface, child: const Icon(Icons.image_not_supported, color: AppTheme.goldColor)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${product.price.toStringAsFixed(0)} ر.ي', style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
                  Row(children: [const Icon(Icons.location_on, size: 10, color: Colors.grey), const SizedBox(width: 2), Expanded(child: Text(product.city ?? 'صنعاء', style: const TextStyle(fontSize: 10, color: Colors.grey)))]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
