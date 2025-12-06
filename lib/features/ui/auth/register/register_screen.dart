import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../core/utils/app_styles.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إنشاء حساب', style: AppStyles.bold24Black)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'الاسم',
              prefixIcon: Icon(CupertinoIcons.person),
              controller: nameController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.blackColor,
            ),
            CustomTextFormField(
              hintText: 'رقم التليفون',
              prefixIcon: Icon(CupertinoIcons.phone),
              controller: phoneController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.blackColor,
            ),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              prefixIcon: Icon(CupertinoIcons.mail),
              controller: emailController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.blackColor,
            ),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              isPassword: true,
              controller: passwordController,
              prefixIcon: Icon(CupertinoIcons.lock),
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.blackColor,
              isObscureText: false,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Checkbox(
                  value: isCheck,
                  onChanged: (value) {
                    isCheck = value!;
                    setState(() {});
                  },
                ),
                Expanded(
                  child: Text(
                    'أوافق على شروط الخدمة وسياسة الخصوصية',
                    style: AppStyles.bold16Green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              text: 'إنشاء الحساب',
              onPressed: () {
                //todo: sign in
              },
              backgroundColor: AppColors.greenColor,
              textStyle: AppStyles.regular18White,
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('هل لديك حساب بالفعل؟', style: AppStyles.bold16Black),
                TextButton(
                  onPressed: () {
                    //todo: navigator to login screen.
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.loginRoute,
                      (route) => false,
                    );
                  },
                  child: Text("تسجيل الدخول", style: AppStyles.bold16Green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
