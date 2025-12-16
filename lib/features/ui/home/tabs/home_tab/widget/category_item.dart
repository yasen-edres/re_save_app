import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  String image;

  String title;
  String description;

  double price;

  CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Container(
            height: 122.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.whiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppStyles.bold20Black),
                      Text(description, style: AppStyles.light16Gray),
                      Spacer(),
                      Text('${price.toInt()} جنيه/القطعه',
                          style: AppStyles.semi14TextBlack),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 37.h,),
                      CircleAvatar(
                        backgroundColor: AppColors.darkGreenColor,
                        radius: 18,
                        child: Icon(
                          CupertinoIcons.add, color: AppColors.whiteColor,
                          size: 17,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
