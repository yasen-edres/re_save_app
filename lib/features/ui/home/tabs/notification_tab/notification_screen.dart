import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الاشعارات', style: AppStyles.bold22Black),
                Row(
                  children: [
                    Icon(Icons.done_all, color: AppColors.greenColor),
                    SizedBox(width: 10.w),
                    Text('تمت القراءة', style: AppStyles.bold18Green),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
