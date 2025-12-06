import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  String image;

  String title;

  double price;

  CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 158.w,
      height: 211.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          SizedBox(height: 122.h, child: Image.asset(image)),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.whiteColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.bold24Black),
                  Text('EGP :${price}', style: AppStyles.semi16TextBlack),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
