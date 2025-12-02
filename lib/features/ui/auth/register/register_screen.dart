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

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register', style: AppStyles.semi20Primary)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Name',
              prefixIcon: Icon(Icons.person),
              controller: nameController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.primaryColor,
            ),
            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
              controller: emailController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.primaryColor,
            ),
            CustomTextFormField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              prefixIcon: Icon(Icons.lock),
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.primaryColor,
              isObscureText: false,
            ),
            CustomTextFormField(
              hintText: 'Re Password',
              isPassword: true,
              controller: rePasswordController,
              filledColor: AppColors.transparentColor,
              borderColor: AppColors.primaryColor,
              prefixIcon: Icon(Icons.lock),

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
                    'I Agree with Terms of Service and Privacy Policy',
                    style: AppStyles.bold16Green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              text: 'Create Account',
              onPressed: () {
                //todo: sign in
              },
              backgroundColor: AppColors.greenColor,
              textStyle: AppStyles.regular18White,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Have Account ?', style: AppStyles.bold16Primary),
                TextButton(
                  onPressed: () {
                    //todo: navigator to login screen.
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.loginRoute,
                      (route) => false,
                    );
                  },
                  child: Text("Login", style: AppStyles.bold16Green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
