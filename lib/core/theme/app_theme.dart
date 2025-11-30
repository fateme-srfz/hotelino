import 'package:Hotelino/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get LightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColors.primary,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: const TextTheme(
        //onboarding screen
        displayLarge: TextStyle(
          fontSize: 24,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.bold,
        ),

        //Hotel Details
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.lightText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: AppColors.lightText,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.lightBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.lightFocusedBorder,
          ),
        ),
        hintStyle: const TextStyle(fontSize: 14, color: AppColors.lightHint),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.lightText,
        ),
      ),
    );

    return baseLight.copyWith(
      colorScheme: baseLight.colorScheme.copyWith(
        outline: Colors.grey[500],
        primaryFixed: AppColors.primary,
        surfaceContainerLow: Colors.grey[200],
      ),
    );
  }

  //_____________________________________________________________________________________

  static ThemeData get darkTheme {
    final baseDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'sahel',
      colorSchemeSeed: AppColors.primary,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        //onboarding screen
        displayLarge: TextStyle(
          fontSize: 24,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.bold,
        ),

        //Hotel Details
        headlineLarge: TextStyle(
          fontSize: 24,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.darkText,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          color: AppColors.darkText,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputFill,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1.5, color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1.5, color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1.5,
            color: AppColors.darkFocusedBorder,
          ),
        ),
        hintStyle: TextStyle(fontSize: 14, color: AppColors.darkHint),
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
      ),
    );
    return baseDark.copyWith(
        colorScheme: baseDark.colorScheme.copyWith(
            primaryFixed: AppColors.primary,
            outline: Colors.grey[500]
            )
    );
  }
}
