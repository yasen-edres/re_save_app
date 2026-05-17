import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/challenge_tab/widget/challenge_item.dart';

import '../../../../../core/utils/app_colors.dart';

class ChallengeTab extends StatelessWidget {
  ChallengeTab({super.key});

  List<Map<String, dynamic>> challengeList = [
    {
      'title': 'تحدي إعادة التدوير الأسبوعي',
      'image': AppAssets.potelCover,
      'description': 'قم بإعادة تدوير 10 مواد مختلفة هذا الأسبوع واحصل على نقاط إضافية. كل مادة تحسب كنقطة واحدة في تحدينا البيئي.',
      'points': '500',
      'difficulty': 'سهل',
      'participants': '234',
      'timeLeft': '3 أيام',
      'category': 'إعادة تدوير'
    },
    {
      'title': 'بطل توفير الطاقة',
      'image': AppAssets.learnRecycleCover,
      'description': 'قلل استهلاك الطاقة بنسبة 20% هذا الشهر. استخدم الأجهزة بكفاءة وشاركنا نتائجك لتكون مصدر إلهام للآخرين.',
      'points': '1500',
      'difficulty': 'متوسط',
      'participants': '89',
      'timeLeft': '12 يوم',
      'category': 'توفير الطاقة'
    },
    {
      'title': 'مجتمع خالٍ من البلاستيك',
      'image': AppAssets.potelCover,
      'description': 'تحدى نفسك بعدم استخدام المنتجات البلاستيكية لمدة أسبوع كامل. استخدم بدائل صديقة للبيئة.',
      'points': '2000',
      'difficulty': 'صعب',
      'participants': '45',
      'timeLeft': '5 أيام',
      'category': 'تقليل البلاستيك'
    },
    {
      'title': 'نباتات منزلية',
      'image': AppAssets.learnRecycleCover,
      'description': 'ازرع 5 نباتات جديدة في منزلك هذا الشهر. ساهم في تحسين جودة الهواء وجعل بيئتك أكثر خضرة.',
      'points': '800',
      'difficulty': 'سهل',
      'participants': '156',
      'timeLeft': '18 يوم',
      'category': 'زراعة'
    },
    {
      'title': 'نقل مستدام',
      'image': AppAssets.potelCover,
      'description': 'استخدم وسائل النقل المستدامة (دراجة، مشي، مواصلات عامة) لمدة 15 يوم هذا الشهر.',
      'points': '1200',
      'difficulty': 'متوسط',
      'participants': '78',
      'timeLeft': '8 أيام',
      'category': 'نقل'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actions: [
          Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(CupertinoIcons.arrow_2_squarepath, color: AppColors.primaryColor,)
          )
        ],
        title: Text('الإيفنتات و التحديات', style: AppStyles.bold24Black,),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.whiteColor,
              AppColors.lightYellowColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                _buildChallengeStats(),
                SizedBox(height: 25.h),
                _buildFilterChips(),
                SizedBox(height: 25.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: challengeList.length,
                  itemBuilder: (context, index) {
                    return ChallengeItem(
                      title: challengeList[index]['title'],
                      image: challengeList[index]['image'],
                      description: challengeList[index]['description'],
                      points: int.parse(challengeList[index]['points']),
                      difficulty: challengeList[index]['difficulty'],
                      participants: challengeList[index]['participants'],
                      timeLeft: challengeList[index]['timeLeft'],
                      category: challengeList[index]['category'],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h);
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeStats() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkGreenColor,
            AppColors.lightGreenColor,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGreenColor.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard(
            title: 'التحديات النشطة',
            value: '12',
            icon: CupertinoIcons.play_circle_fill,
          ),
          _buildStatCard(
            title: 'المشاركون',
            value: '602',
            icon: CupertinoIcons.person_2_fill,
          ),
          _buildStatCard(
            title: 'الجائزة الكبرى',
            value: '5000',
            icon: CupertinoIcons.star_circle_fill,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.whiteColor,
          size: 30,
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: AppStyles.bold24White,
        ),
        SizedBox(height: 4.h),
        Text(
          title,
          style: AppStyles.light16White,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    List<String> filters = ['الكل', 'نشط', 'مكتمل', 'قادم'];
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: index == 0 ? AppColors.darkGreenColor : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.darkGreenColor,
                width: 1,
              ),
            ),
            child: Text(
              filters[index],
              style: index == 0
                  ? AppStyles.bold16White
                  : AppStyles.bold16PrimaryDark,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
      ),
    );
  }
}
