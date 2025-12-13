import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/features/widget/custom_setting_bottom.dart';

import '../../../../../core/utils/app_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(AppAssets.yassinImage),
                        ),
                        SizedBox(width: 20.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ياسين إدريس', style: AppStyles.bold24Black,),
                            Text('المستوى 3', style: AppStyles.light16Black,),
                          ],
                        ),
                        Spacer(),
                        Icon(CupertinoIcons.bell, color: AppColors.blackColor,
                          size: 30,)
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF087F3F),
                        Color(0xFF3FA755),
                      ],
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('25 جنيه', style: AppStyles.bold24White,),
                        Text('الرصيد الحالي', style: AppStyles.bold20White,),
                      ],
                    ),
                    Icon(CupertinoIcons.money_dollar_circle_fill,
                      color: AppColors.whiteColor, size: 35,)
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "الإعدادات والخصوصية", style: AppStyles.bold20Black,)),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    CustomSettingBottom(
                        title: 'الحساب', icon: CupertinoIcons.person),
                    CustomSettingBottom(
                        title: 'تغيير كلمة المرور', icon: CupertinoIcons.lock),
                    CustomSettingBottom(
                        title: 'اللغه', icon: CupertinoIcons.globe),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text("الحساب", style: AppStyles.bold20Black,)),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    CustomSettingBottom(
                        title: 'طلباتي', icon: CupertinoIcons.cart),
                    CustomSettingBottom(
                        title: 'العناوين', icon: CupertinoIcons.map),
                    CustomSettingBottom(title: 'دعوه الاصدقاء',
                        icon: CupertinoIcons.person_add),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text("الماليات", style: AppStyles.bold20Black,)),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    CustomSettingBottom(
                        title: 'طلب الكاش', icon: CupertinoIcons.money_dollar),
                    CustomSettingBottom(title: 'المحافظ الماليه',
                        icon: CupertinoIcons.creditcard),
                    CustomSettingBottom(title: 'التحويلات',
                        icon: CupertinoIcons.arrow_right_arrow_left),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text("الدعم الفني", style: AppStyles.bold20Black,)),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  children: [
                    CustomSettingBottom(title: 'الشروط والاحكام',
                        icon: CupertinoIcons.doc_text),
                    CustomSettingBottom(title: ' سياسه الخوصوصيه',
                        icon: CupertinoIcons.person_crop_circle),
                    CustomSettingBottom(
                        title: 'تواصل معنا', icon: CupertinoIcons.chat_bubble),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
