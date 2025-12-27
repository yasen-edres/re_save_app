import 'package:flutter/material.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData themeMode = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightYellowColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.lightGreenColor,
      selectedLabelStyle: AppStyles.bold16Primary,
    ),
    scaffoldBackgroundColor: AppColors.lightYellowColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightYellowColor,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: AppColors.blackColor
          )
      ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.greenColor,
      shape: StadiumBorder(
        side: BorderSide(color: AppColors.whiteColor, width: 3),
      ),
    ),
  );
}