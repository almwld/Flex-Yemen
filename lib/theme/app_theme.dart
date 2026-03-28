import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Colors
  static const Color goldColor = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF4D03F);
  static const Color goldDark = Color(0xFFB8860B);
  static const Color goldPrimary = Color(0xFFC6A700);

  // Status Colors
  static const Color success = Color(0xFF2ECC71);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);
  static const Color warning = Color(0xFFF39C12);

  // Dark Mode Colors
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextLight = Color(0xFFE0E0E0);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
  static const Color darkDivider = Color(0xFF3C3C3C);

  // Light Mode Colors
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightCard = Color(0xFFFAFAFA);
  static const Color lightText = Color(0xFF000000);
  static const Color lightTextSecondary = Color(0xFF666666);
  static const Color lightDivider = Color(0xFFE0E0E0);

  // Gradients
  static const LinearGradient goldGradient = LinearGradient(
    colors: [goldColor, goldLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkSurface, darkCard],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: goldColor,
      scaffoldBackgroundColor: lightBackground,
      cardColor: lightCard,
      dividerColor: lightDivider,
      fontFamily: 'Changa',
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: goldColor,
        secondary: goldLight,
        surface: lightSurface,
        background: lightBackground,
        error: error,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: lightText,
        onBackground: lightText,
        onError: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightSurface,
        foregroundColor: lightText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.changa(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: lightText,
        ),
      ),
      cardTheme: CardTheme(
        color: lightCard,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightSurface,
        selectedItemColor: goldColor,
        unselectedItemColor: lightTextSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: goldColor,
          foregroundColor: Colors.black,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: goldColor,
          side: const BorderSide(color: goldColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: goldColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: goldColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.changa(fontSize: 32, fontWeight: FontWeight.bold, color: lightText),
        displayMedium: GoogleFonts.changa(fontSize: 28, fontWeight: FontWeight.bold, color: lightText),
        displaySmall: GoogleFonts.changa(fontSize: 24, fontWeight: FontWeight.bold, color: lightText),
        headlineLarge: GoogleFonts.changa(fontSize: 22, fontWeight: FontWeight.bold, color: lightText),
        headlineMedium: GoogleFonts.changa(fontSize: 20, fontWeight: FontWeight.bold, color: lightText),
        headlineSmall: GoogleFonts.changa(fontSize: 18, fontWeight: FontWeight.bold, color: lightText),
        titleLarge: GoogleFonts.changa(fontSize: 16, fontWeight: FontWeight.w600, color: lightText),
        titleMedium: GoogleFonts.changa(fontSize: 14, fontWeight: FontWeight.w600, color: lightText),
        titleSmall: GoogleFonts.changa(fontSize: 12, fontWeight: FontWeight.w600, color: lightText),
        bodyLarge: GoogleFonts.changa(fontSize: 16, color: lightText),
        bodyMedium: GoogleFonts.changa(fontSize: 14, color: lightText),
        bodySmall: GoogleFonts.changa(fontSize: 12, color: lightTextSecondary),
        labelLarge: GoogleFonts.changa(fontSize: 14, fontWeight: FontWeight.w500, color: lightText),
        labelMedium: GoogleFonts.changa(fontSize: 12, fontWeight: FontWeight.w500, color: lightTextSecondary),
        labelSmall: GoogleFonts.changa(fontSize: 10, fontWeight: FontWeight.w500, color: lightTextSecondary),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: goldColor,
      scaffoldBackgroundColor: darkBackground,
      cardColor: darkCard,
      dividerColor: darkDivider,
      fontFamily: 'Changa',
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: goldColor,
        secondary: goldLight,
        surface: darkSurface,
        background: darkBackground,
        error: error,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: darkText,
        onBackground: darkText,
        onError: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.changa(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: darkText,
        ),
      ),
      cardTheme: CardTheme(
        color: darkCard,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkSurface,
        selectedItemColor: goldColor,
        unselectedItemColor: darkTextSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: goldColor,
          foregroundColor: Colors.black,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: goldColor,
          side: const BorderSide(color: goldColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: goldColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: goldColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.changa(fontSize: 32, fontWeight: FontWeight.bold, color: darkText),
        displayMedium: GoogleFonts.changa(fontSize: 28, fontWeight: FontWeight.bold, color: darkText),
        displaySmall: GoogleFonts.changa(fontSize: 24, fontWeight: FontWeight.bold, color: darkText),
        headlineLarge: GoogleFonts.changa(fontSize: 22, fontWeight: FontWeight.bold, color: darkText),
        headlineMedium: GoogleFonts.changa(fontSize: 20, fontWeight: FontWeight.bold, color: darkText),
        headlineSmall: GoogleFonts.changa(fontSize: 18, fontWeight: FontWeight.bold, color: darkText),
        titleLarge: GoogleFonts.changa(fontSize: 16, fontWeight: FontWeight.w600, color: darkText),
        titleMedium: GoogleFonts.changa(fontSize: 14, fontWeight: FontWeight.w600, color: darkText),
        titleSmall: GoogleFonts.changa(fontSize: 12, fontWeight: FontWeight.w600, color: darkText),
        bodyLarge: GoogleFonts.changa(fontSize: 16, color: darkText),
        bodyMedium: GoogleFonts.changa(fontSize: 14, color: darkText),
        bodySmall: GoogleFonts.changa(fontSize: 12, color: darkTextSecondary),
        labelLarge: GoogleFonts.changa(fontSize: 14, fontWeight: FontWeight.w500, color: darkText),
        labelMedium: GoogleFonts.changa(fontSize: 12, fontWeight: FontWeight.w500, color: darkTextSecondary),
        labelSmall: GoogleFonts.changa(fontSize: 10, fontWeight: FontWeight.w500, color: darkTextSecondary),
      ),
    );
  }

  // Helper Methods
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkText : lightText;
  }

  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkTextSecondary : lightTextSecondary;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkBackground : lightBackground;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkCard : lightCard;
  }

  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkSurface : lightSurface;
  }

  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? darkDivider : lightDivider;
  }
}
