import 'package:flutter/material.dart';
import 'package:taskati/core/styles/text_styles.dart';

import '../constants/app_fonts.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.whiteColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.title2.copyWith(color: AppColors.blackColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.caption1.copyWith(color: AppColors.greyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor, // app theme color
      onSurface: AppColors.blackColor, // Text color
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
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.blackColor,
      selectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
