import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/challenge_tab/widget/challenge_item.dart';

import '../../../../../core/utils/app_colors.dart';

class ChallengeTab extends StatelessWidget {
  ChallengeTab({super.key});

  List<Map<String, String>> challengeList = [
    {
      'title': 'اختبر تطبيقنا الآن',
      'image': AppAssets.potelCover,
      'description': 'اكتشف ميزات تطبيقنا بسهولة وسرعة. جربه اليوم وشاركنا رأيك لتحسين تجربتك المستقبلية.',
      'points': '1000'
    },
    {
      'title': 'اختبر تطبيقنا الآن',
      'image': AppAssets.potelCover,
      'description': 'اكتشف ميزات تطبيقنا بسهولة وسرعة. جربه اليوم وشاركنا رأيك لتحسين تجربتك المستقبلية.',
      'points': '1000'
    },
    {
      'title': 'اختبر تطبيقنا الآن',
      'image': AppAssets.potelCover,
      'description': 'اكتشف ميزات تطبيقنا بسهولة وسرعة. جربه اليوم وشاركنا رأيك لتحسين تجربتك المستقبلية.',
      'points': '1000'
    },
    {
      'title': 'اختبر تطبيقنا الآن',
      'image': AppAssets.potelCover,
      'description': 'اكتشف ميزات تطبيقنا بسهولة وسرعة. جربه اليوم وشاركنا رأيك لتحسين تجربتك المستقبلية.',
      'points': '1000'
    },
    {
      'title': 'اختبر تطبيقنا الآن',
      'image': AppAssets.potelCover,
      'description': 'اكتشف ميزات تطبيقنا بسهولة وسرعة. جربه اليوم وشاركنا رأيك لتحسين تجربتك المستقبلية.',
      'points': '1000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actions: [
          Icon(CupertinoIcons.arrow_2_squarepath, color: AppColors.blackColor,)
        ],
        title: Text('الإيفنتات و التحديات', style: AppStyles.bold24Black,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2000.h,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                      vertical: 30.h
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: challengeList.length,
                  itemBuilder: (context, index) {
                    return ChallengeItem(
                        title: challengeList[index]['title']!,
                        image: challengeList[index]['image']!,
                        description: challengeList[index]['description']!,
                        points: int.parse(challengeList[index]['points']!)
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
