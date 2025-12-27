import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class CustomBottomSheetContent extends StatelessWidget {
  String name;
  String description;
  String image;

  CustomBottomSheetContent({
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('أضف الكمية بالولزن', style: AppStyles.bold24Black),
              Text('الوزن يقاس بالكيلوجرام', style: AppStyles.light16Gray),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(image, width: 150.w, height: 150.h),
                    ),
                    Text(name, style: AppStyles.bold20Black),
                    Text(description, style: AppStyles.light16Gray),
                    Text('الحد الادني للطلب هو 25 جنيهًا'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
