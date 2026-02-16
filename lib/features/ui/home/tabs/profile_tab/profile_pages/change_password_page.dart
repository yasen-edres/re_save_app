import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';

class ChangePasswordPage extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  bool passwordObscure = false;
  TextEditingController newPasswordController = TextEditingController();
  bool newPasswordObscure = false;
  TextEditingController checkNewPasswordController = TextEditingController();
  bool checkNewPasswordObscure = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightYellowColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: 0, bottom: 30.h, left: 20.w, right: 20.w),
            child: Form(
              key: context
                  .read<ProfileViewModel>()
                  .formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("تغيير كلمة المرور", style: AppStyles.bold22Black),
                  SizedBox(height: 40.h),
                  Text('كلمة الدخول الحالية', style: AppStyles.bold18Black),
                  SizedBox(
                    width: double.infinity,
                    child: CustomTextFormField(
                      hintText: 'أدخل كلمة الدخول الحالية',
                      isObscureText: passwordObscure,
                      controller: passwordController,
                      isPassword: true,
                    ),
                  ),
                  Text('كلمة الدخول الجديد', style: AppStyles.bold18Black),
                  SizedBox(
                    width: double.infinity,
                    child: CustomTextFormField(
                      hintText: 'أدخل كلمة الدخول الجديد',
                      isObscureText: newPasswordObscure,
                      controller: newPasswordController,
                      isPassword: true,
                    ),
                  ),
                  Text(
                      'تأكيد كلمة الدخول الجديد', style: AppStyles.bold18Black),
                  SizedBox(
                    width: double.infinity,
                    child: CustomTextFormField(
                      hintText: 'أكد كلمة الدخول الجديد',
                      isObscureText: checkNewPasswordObscure,
                      controller: checkNewPasswordController,
                      isPassword: true,
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    text: 'إرسال',
                    onPressed: () {
                      //todo: save changes
                      context.read<ProfileViewModel>().changePassword(
                          passwordController.text, newPasswordController.text);
                    },
                    backgroundColor: AppColors.darkGreenColor,
                    textStyle: AppStyles.bold24White,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
