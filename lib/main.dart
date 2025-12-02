import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_theme.dart';
import 'package:re_save_app/features/ui/auth/login/login_screen.dart';
import 'package:re_save_app/features/ui/auth/register/register_screen.dart';

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
          initialRoute: AppRoutes.loginRoute,
          routes: {
            AppRoutes.loginRoute : (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
          },
          theme: AppTheme.themeMode,
        );
      },
    );
  }

}