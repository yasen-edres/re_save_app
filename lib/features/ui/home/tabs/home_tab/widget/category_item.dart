import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_view_model.dart';
import 'package:readmore/readmore.dart';

class CategoryItem extends StatelessWidget {
  String image;
  String title;
  String description;
  double price;
  String category;

  CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
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
                    onPressed: () async {
                      final file = await assetToFile(image);
                      context.read<OrderViewModel>().addImage(image: file);
                      context.read<OrderViewModel>().changeOrderName(title);
                      context.read<OrderViewModel>().changeSelectOption(
                          category);
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

  /// يحوّل صورة من assets إلى File مؤقت
  Future<File> assetToFile(String assetPath) async {
    // 1. تحميل الصورة من assets
    ByteData data = await rootBundle.load(assetPath);
    Uint8List bytes = data.buffer.asUint8List();

    // 2. الحصول على مجلد مؤقت
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath
        .split('/')
        .last}');

    // 3. كتابة الصورة كملف
    await file.writeAsBytes(bytes);

    return file;
  }
}
