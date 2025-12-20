import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:readmore/readmore.dart';

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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppStyles.bold20Black,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.visible,),
                        ReadMoreText(
                          description,
                          trimLines: 2,
                          colorClickableText: AppColors.greenColor,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '... اقرأ المزيد',
                          isExpandable: false,
                          style: AppStyles.light16Gray,
                          moreStyle: AppStyles.semi14TextBlack.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text('${price.toInt()} جنيه/القطعه',
                          style: AppStyles.semi14TextBlack,
                          softWrap: true,
                          overflow: TextOverflow.visible,),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.addTabRoute);
                    },
                    icon: CircleAvatar(
                      backgroundColor: AppColors.greenColor,
                      radius: 18,
                      child: Icon(
                          CupertinoIcons.add, color: AppColors.whiteColor,
                          size: 17),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
