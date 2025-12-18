import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/widget/custom_elevatedbutton.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../core/utils/app_routes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h,),
            Text('نسيت كلمة المرور؟', style: AppStyles.bold24Black),
            SizedBox(height: 50.h,),
            SizedBox(
              width: double.infinity,
              child: CustomTextFormField(
                hintText: 'أدخل رقمك....',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                suffixIcon: Icon(CupertinoIcons.phone),
              ),
            ),
            SizedBox(height: 30.h,),
            CustomElevatedButton(
                text: 'استمرار',
                onPressed: () {
                  //todo: forget password logic.
                },
                backgroundColor: AppColors.darkGreenColor,
                textStyle: AppStyles.bold20White
            ),
            Spacer(),
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
