import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;

  const SimpleAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Changa',
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor ?? (isDark ? AppTheme.darkSurface : AppTheme.lightSurface),
      foregroundColor: AppTheme.getTextColor(context),
      leading: leading ??
          (showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
