import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

class EditProfilePage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController(
    text: 'yasen.ehab.23093@gmail.com',
  );
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightYellowColor,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تعديل بينات الحساب', style: AppStyles.bold22Black),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70.w,
                      backgroundColor: AppColors.greenColor,
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: AppColors.whiteColor,
                        size: 100.w,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 100.h),
                        Row(
                          children: [
                            SizedBox(width: 100.w),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.darkGreenColor,
                              child: Icon(
                                Icons.edit_outlined,
                                color: AppColors.whiteColor,
                                size: 25.w,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text('الاسم', style: AppStyles.bold18Black),
            SizedBox(
              width: double.infinity,
              child: CustomTextFormField(
                filledColor: AppColors.transparentColor,
                borderColor: AppColors.lightGrayColor,
                hintText: 'أدخل الاسم',
                controller: nameController,
              ),
            ),
            Text('البريد الإلكتروني', style: AppStyles.bold18Black),
            SizedBox(
              width: double.infinity,
              child: CustomTextFormField(
                controller: emailController,
                filledColor: AppColors.transparentColor,
                borderColor: AppColors.lightGrayColor,
                hintText: 'أدخل البريد الإلكتروني',
              ),
            ),
            Text('رقم التليفون', style: AppStyles.bold18Black),
            SizedBox(
              width: double.infinity,
              child: CustomTextFormField(
                controller: phoneController,
                hintText: 'أدخل رقم الهاتف',
                filledColor: AppColors.transparentColor,
                borderColor: AppColors.lightGrayColor,
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              text: 'حفظ',
              onPressed: () {
                //todo: save changes
              },
              backgroundColor: AppColors.darkGreenColor,
              textStyle: AppStyles.bold24White,
            ),
          ],
        ),
      ),
    );
  }
}
