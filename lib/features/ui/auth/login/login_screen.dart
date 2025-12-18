import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول', style: AppStyles.bold24Black,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 10.w
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: emailController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.blackColor,
              hintText: 'أدخل بريدك الإلكتروني',
              prefixIcon: Icon(CupertinoIcons.mail),
            ),
            CustomTextFormField(
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
              isObscureText: true,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.blackColor,
              hintText: "أدخل كلمة المرور",
              controller: passwordController,
            ),
            TextButton(
              onPressed: () {
                //todo: navigator to forget password screen
              },
              child: Text(
                'نسيت كلمة المرور؟', style: AppStyles.bold16Green,),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  //todo: Sign in.
                  Navigator.of(context).pushReplacementNamed(
                      AppRoutes.homeRoute);
                },
                backgroundColor: AppColors.lightGreenColor,
                textStyle: AppStyles.regular18White,
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                Expanded(
                    child: Divider(
                        thickness: 1.5,
                        color: Colors.green
                    )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text('أو', style: AppStyles.bold16Green,),
                ),
                Expanded(
                    child: Divider(
                        thickness: 1.5,
                        color: Colors.green
                    )
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            InkWell(
              onTap: () {
                //todo: login with google.
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: AppColors.blackColor,
                        width: 1.5
                    )
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Brand(Brands.google),
                    SizedBox(width: 8.w,),
                    Text('المتابعة عبر جوجل',
                      style: AppStyles.medium18Header,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ليس لديك حساب؟",
                  style: AppStyles.bold16Black,),
                TextButton(
                    onPressed: () {
                      //todo: navigator to register screen.
                      Navigator.of(context).pushNamed(AppRoutes.registerRoute);
                    },
                    child: Text("إنشاء حساب", style: AppStyles.bold16Green,)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
