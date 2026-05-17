import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class ChallengeItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final int points;
  final String difficulty;
  final String participants;
  final String timeLeft;
  final String category;

  const ChallengeItem({
    required this.title,
    required this.image,
    required this.description,
    required this.points,
    required this.difficulty,
    required this.participants,
    required this.timeLeft,
    required this.category,
  });

  Color getDifficultyColor() {
    switch (difficulty) {
      case 'سهل':
        return AppColors.greenColor;
      case 'متوسط':
        return AppColors.orangeColor;
      case 'صعب':
        return AppColors.redColor;
      default:
        return AppColors.grayColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: getDifficultyColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  difficulty,
                  style: AppStyles.bold14Black.copyWith(
                    color: getDifficultyColor(),
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  category,
                  style: AppStyles.bold14Black.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Image.asset(
              image,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Text(title, style: AppStyles.bold20Black),
          SizedBox(height: 8.h),
          Text(description, style: AppStyles.light16Gray, maxLines: 2, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(
                CupertinoIcons.person_2,
                color: AppColors.grayColor,
                size: 16,
              ),
              SizedBox(width: 4.w),
              Text(
                participants,
                style: AppStyles.light14SearchHint,
              ),
              SizedBox(width: 16.w),
              Icon(
                CupertinoIcons.time,
                color: AppColors.grayColor,
                size: 16,
              ),
              SizedBox(width: 4.w),
              Text(
                timeLeft,
                style: AppStyles.light14SearchHint,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.star_fill,
                    color: AppColors.orangeColor,
                    size: 20,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '+${points} نقطة',
                    style: AppStyles.semi16TextBlack,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.lightGreenColor,
                      AppColors.darkGreenColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkGreenColor.withOpacity(0.3),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text('انضم الآن', style: AppStyles.bold16White),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
