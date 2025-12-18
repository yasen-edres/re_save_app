import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_theme.dart';
import 'package:re_save_app/features/ui/auth/login/login_screen.dart';
import 'package:re_save_app/features/ui/auth/register/register_screen.dart';
import 'package:re_save_app/features/ui/home/tabs/profile_tab/profile_pages/change_password_page.dart';
import 'package:re_save_app/features/ui/home/tabs/profile_tab/profile_pages/edit_profile_page.dart';

import 'features/ui/home/home_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeRoute,
          routes: {
            AppRoutes.loginRoute : (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.editProfilePageRoute: (context) => EditProfilePage(),
            AppRoutes.editProfilePageRoute: (context) => ChangePasswordPage(),
          },
          locale: Locale('ar'),
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme.themeMode,
        );
      },
    );
  }

}