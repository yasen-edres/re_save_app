import 'package:flutter/material.dart';
import 'package:re_save_app/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData themeMode = ThemeData(
    scaffoldBackgroundColor: AppColors.lightYellowColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightYellowColor,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: AppColors.primaryColor
          )
      )
  );
}