import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/config/di.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_theme.dart';
import 'package:re_save_app/features/ui/auth/forget_password/forget_password_screen.dart';
import 'package:re_save_app/features/ui/auth/login/login_screen.dart';
import 'package:re_save_app/features/ui/auth/register/register_screen.dart';
import 'package:re_save_app/features/ui/cubit/profile_view_model.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/add_screen.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cart_screen.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/notification_tab/notification_screen.dart';
import 'package:re_save_app/features/ui/home/tabs/profile_tab/profile_pages/change_password_page.dart';
import 'package:re_save_app/features/ui/home/tabs/profile_tab/profile_pages/edit_profile_page.dart';

import 'features/ui/auth/login/cubit/login_view_model.dart';
import 'features/ui/home/home_screen.dart';
import 'features/ui/home/tabs/profile_tab/profile_pages/orders_page.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await LoginViewModel.checkAutoLogin();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        BlocProvider(
          create: (_) => getIt<ProfileViewModel>(),
        ),
        BlocProvider<LoginViewModel>(
          create: (_) => getIt<LoginViewModel>(),
        ),
        BlocProvider<CategoryViewModel>(
          create: (_) => CategoryViewModel(),
        ),
        BlocProvider<OrderViewModel>(
          create: (_) => OrderViewModel(),
        ),
      ],
      child: MyApp(isLoggedIn: isLoggedIn,)));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn ? HomeScreen() : LoginScreen(),
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.ordersPageRoute: (context) => OrdersPage(),
            AppRoutes.addTabRoute: (context) => AddScreen(),
            AppRoutes.cartTabRoute: (context) => CartScreen(),
            AppRoutes.notificationTabRoute: (context) => NotificationScreen(),
            AppRoutes.forgetPasswordRoute: (context) => ForgetPasswordScreen(),
            AppRoutes.editProfilePageRoute: (context) => EditProfilePage(),
            AppRoutes.changePasswordPageRoute: (context) =>
                ChangePasswordPage(),
          },
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: const [
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