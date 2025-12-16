import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class ChallengeItem extends StatelessWidget {
  String title;
  String description;
  String image;
  int points;

  ChallengeItem({
    required this.title,
    required this.image,
    required this.description,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGrayColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Image.asset(image),
          ),
          SizedBox(height: 10.h),
          Text(title, style: AppStyles.bold20Black),
          SizedBox(height: 10.h),
          Text(description, style: AppStyles.light16Gray),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('+${points} نقطة', style: AppStyles.semi16TextBlack),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text('انضم الآن', style: AppStyles.bold16Black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
