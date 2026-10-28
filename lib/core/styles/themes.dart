import 'package:flutter/material.dart';
import 'package:taskati/core/styles/text_styles.dart';

import '../constants/app_fonts.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: LightPalette.primaryColor,
    hoverColor: LightPalette.primaryColor100,
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: LightPalette.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: LightPalette.background,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.title2.copyWith(
        color: LightPalette.textPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption1.copyWith(color: LightPalette.greyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      tertiary: LightPalette.secondaryColor,
      secondary: LightPalette.greyColor,
      error: LightPalette.redColor,
      inversePrimary: LightPalette.textInverse,
      seedColor: LightPalette.primaryColor, // app theme color
      onSurface: LightPalette.textPrimary, // Text color
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: LightPalette.primaryColor,
      unselectedItemColor: LightPalette.textPrimary,
      selectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    hoverColor: LightPalette.primaryColor100,
    primaryColor: LightPalette.primaryColor,
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: DarkPalette.background,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkPalette.background,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.title2.copyWith(
        color: DarkPalette.textPrimary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption1.copyWith(color: DarkPalette.greyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      inversePrimary: DarkPalette.textInverse,
      tertiary: DarkPalette.secondaryColor,
      brightness: Brightness.dark,

      error: LightPalette.redColor,
      seedColor: DarkPalette.primaryColor, // app theme color
      onSurface: DarkPalette.textPrimary, // Text color
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: DarkPalette.primaryColor,
      unselectedItemColor: DarkPalette.textPrimary,
      selectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
