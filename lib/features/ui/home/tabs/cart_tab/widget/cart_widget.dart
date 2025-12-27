import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class CartWidget extends StatelessWidget {
  CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrayColor),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(AppAssets.keyboard, fit: BoxFit.fill),
              ),
              SizedBox(width: 20.w),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('car oil', style: AppStyles.bold16Black),
                    Text('asdadasdsd', style: AppStyles.light16Gray),
                    SizedBox(
                      width: 300.w,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            color: AppColors.lightGrayColor,
                            child: Icon(CupertinoIcons.minus, size: 20),
                          ),
                          SizedBox(width: 20.w),
                          Text('1.5'),
                          SizedBox(width: 20.w),
                          Container(
                            padding: EdgeInsets.all(4),
                            color: AppColors.darkGreenColor,
                            child: Icon(
                              CupertinoIcons.add,
                              color: AppColors.whiteColor,
                              size: 20,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal: 20.w,
                            ),
                            color: AppColors.lightGrayColor,
                            child: Text('132.', style: AppStyles.bold14Black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: Transform.translate(
            offset: const Offset(-8, -8),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.lightGrayColor,
              child: IconButton(
                onPressed: () {
                  //todo: remove order from cart
                },
                icon: Icon(
                  CupertinoIcons.xmark,
                  size: 14,
                  color: AppColors.grayColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
