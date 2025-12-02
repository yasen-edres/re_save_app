import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 10.w
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login', style: AppStyles.semi20Primary,),
                  ],
                ),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
                CustomTextFormField(
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  isObscureText: true,
                  hintText: "Enter your password",
                  hintStyle: AppStyles.light18HintText,
                  filledColor: AppColors.whiteColor,
                  controller: passwordController,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //todo: navigator to forget password screen
                  },
                  child: Text(
                    'Forget Password?', style: AppStyles.bold16Green,),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: 'Sign in',
                    onPressed: () {
                      //todo: Sign in.
                    },
                    backgroundColor: AppColors.greenColor,
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
                      child: Text('OR', style: AppStyles.bold16Green,),
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
                        Text('Continue With Google',
                          style: AppStyles.medium18Header,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 300.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have An Account?",
                      style: AppStyles.bold16Primary,),
                    TextButton(
                        onPressed: () {
                          //todo: navigator to register screen.
                        },
                        child: Text("sign Up", style: AppStyles.bold16Green,)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
