import 'package:flutter/material.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData themeMode = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightYellowColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.greenColor,
      // selectedItemColor: AppColor.whiteBgColor,
      // unselectedItemColor: AppColor.whiteBgColor,
      selectedLabelStyle: AppStyles.bold16Primary,
    ),
    scaffoldBackgroundColor: AppColors.lightYellowColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          iconTheme: IconThemeData(
              color: AppColors.blackColor
          )

      ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkGreenColor,
      shape: StadiumBorder(
        side: BorderSide(color: AppColors.whiteColor, width: 6),
      ),
      // RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(35),
      //   side: BorderSide(
      //     width: 4,
      //     color: AppColor.whiteColor
      //   )
      // )
    ),
  );
}