import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سلة التسوق'), centerTitle: true, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('سلة التسوق فارغة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('أضف منتجات إلى سلتك لتظهر هنا', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            CustomButton(
              text: 'تسوق الآن',
              onPressed: () => Navigator.pop(context),
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
