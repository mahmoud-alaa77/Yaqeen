import 'package:flutter/material.dart';
import 'package:islamic_app/core/theming/app_colors.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.customWhiteColor,
    fontFamily: "Jomhuria",
    brightness: Brightness.light,
    // textTheme: TextTheme(
    //   bodyLarge: AppTextStyles.fontBodyLarge,
    //   bodySmall: AppTextStyles.fontBodySmall,
    //   bodyMedium: AppTextStyles.fontBodyMeduim,
    // ),
    
  );

  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.customBlackColor.withOpacity(.7),
    fontFamily: "Jomhuria",
    brightness: Brightness.dark,
    // textTheme: TextTheme(
    //   bodyLarge: AppTextStyles.fontBodyLarge,
    //   bodySmall: AppTextStyles.fontBodySmall,
    //   bodyMedium: AppTextStyles.fontBodyMeduim,
    // ),
  );
}
