import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light(ColorScheme? scheme) {
    final colorScheme = scheme ?? const ColorScheme.light(
      primary: Color(0xFFE84D6E),
      onPrimary: Colors.white,
      secondary: Color(0xFFF6B2C1),
      surface: Colors.white,
      onSurface: Color(0xFF1F1F1F),
      background: Color(0xFFF7F7FA),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: Color(0xFFE6E6EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(width: 1.6),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      chipTheme: const ChipThemeData(
        shape: StadiumBorder(),
      ),
    );
  }
}
