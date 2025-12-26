import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/features/ui/auth/register/cubit/register_state.dart';
import 'package:re_save_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../config/di.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';

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
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          DialogUtils.showLoading(context: context, message: 'Loding...');
        } else if (state is RegisterError) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context, message: state.errorMessage);
        } else if (state is RegisterSuccess) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context, message: 'register Successfully',
              posActionName: 'Ok',
              posAction: () {
                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              }
          );
        }
      },
      bloc: viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text('إنشاء حساب', style: AppStyles.bold24Black)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'الاسم',
                  prefixIcon: Icon(CupertinoIcons.person),
                  controller: nameController,
                  filledColor: AppColors.transparentColor,
                  borderColor: AppColors.blackColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل الاسم';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: 'رقم التليفون',
                  prefixIcon: Icon(CupertinoIcons.phone),
                  controller: phoneController,
                  filledColor: AppColors.transparentColor,
                  borderColor: AppColors.blackColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل رقم التليفون';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: 'البريد الإلكتروني',
                  prefixIcon: Icon(CupertinoIcons.mail),
                  controller: emailController,
                  filledColor: AppColors.transparentColor,
                  borderColor: AppColors.blackColor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل البريد الإلكتروني';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: 'كلمة المرور',
                  isPassword: true,
                  controller: passwordController,
                  prefixIcon: Icon(CupertinoIcons.lock),
                  filledColor: AppColors.transparentColor,
                  borderColor: AppColors.blackColor,
                  isObscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك أدخل كلمة المرور';
                    }
                    return null;
                  },
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
                    //todo: sign up
                    viewModel.register(
                        nameController.text, emailController.text,
                        passwordController.text);
                  },
                  backgroundColor: AppColors.lightGreenColor,
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
        ),
      ),
    );
  }
}
