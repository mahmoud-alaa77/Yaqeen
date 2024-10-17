import 'package:flutter/material.dart';
import 'package:islamic_app/core/theming/app_colors.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.customWhiteColor,

      
      brightness: Brightness.light
      
      );

  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.customBlackColor,

      brightness: Brightness.dark);
}
