import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class CustomSettingBottom extends StatelessWidget {
  String title;
  IconData icon;

  CustomSettingBottom({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.blackColor, size: 25),
          SizedBox(width: 10.w),
          Text(title, style: AppStyles.bold18Black),
          Spacer(),
          Icon(CupertinoIcons.forward, color: AppColors.blackColor),
        ],
      ),
    );
  }
}
