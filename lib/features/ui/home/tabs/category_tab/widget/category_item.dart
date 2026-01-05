import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/domain/entities/response/public/item.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../widget/custom_bootom_sheet.dart';

class CategoryItem extends StatelessWidget {
  Item item;

  CategoryItem({
    super.key,
    required this.item
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
          Stack(
            children: [
              Container(
                height: 120.h,
                child: CachedNetworkImage(
                  imageUrl: item.image ?? '',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.lightGrayColor,
                    highlightColor: AppColors.whiteColor,
                    child: Container(
                      width: double.infinity,
                      height: 120.h,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.lightYellowColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_up,
                    color: AppColors.darkGreenColor,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.whiteColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name!, style: AppStyles.bold20Black,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.visible,),
                        ReadMoreText(
                          item.description!,
                          trimLines: 2,
                          colorClickableText: AppColors.greenColor,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '... اقرأ المزيد',
                          isExpandable: false,
                          style: AppStyles.light16Gray,
                          moreStyle: AppStyles.semi14TextBlack.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h,),
                        Flexible(
                          child: AutoSizeText(
                            '${item.price} نقطة/القطعه',
                            style: AppStyles.semi14TextBlack,
                            maxLines: 1,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showCustomBottomSheet(context);
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



  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return CustomBottomSheetContent(item: item,);
        }
    );
  }
}