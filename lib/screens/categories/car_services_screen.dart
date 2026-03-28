import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ${category^}Screen extends StatelessWidget {
  const ${category^}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${category.replaceAll('_', ' ')}'),
      body: const Center(
        child: Text('قيد التطوير'),
      ),
    );
  }
}
