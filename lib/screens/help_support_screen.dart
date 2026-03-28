import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'faq_screen.dart';
import 'contact_us_screen.dart';
import 'support_tickets_screen.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const CustomAppBar(title: 'المساعدة والدعم'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuItem(context, 'الأسئلة الشائعة', Icons.help_outline, () => Navigator.pushNamed(context, '/faq')),
          _buildMenuItem(context, 'تواصل معنا', Icons.contact_mail, () => Navigator.pushNamed(context, '/contact_us')),
          _buildMenuItem(context, 'تذاكر الدعم', Icons.confirmation_number, () => Navigator.pushNamed(context, '/support_tickets')),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.goldColor),
        title: Text(title, style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
