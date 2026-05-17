import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'تحدي جديد متاح!',
      'message': 'انضم إلى تحدي إعادة التدوير الأسبوعي واحصل على 500 نقطة.',
      'time': '2 ساعات',
      'isRead': false,
      'type': 'challenge',
      'icon': CupertinoIcons.star_circle,
    },
    {
      'title': 'تهانينا! 🎉',
      'message': 'لقد أكملت تحدي توفير الطاقة بنجاح. +1500 نقطة تمت إضافتها.',
      'time': '5 ساعات',
      'isRead': false,
      'type': 'achievement',
      'icon': CupertinoIcons.star_circle_fill,
    },
    {
      'title': 'تذكير يومي',
      'message': 'لا تنسَ تسجيل أنشطة إعادة التدوير اليوم.',
      'time': '1 يوم',
      'isRead': true,
      'type': 'reminder',
      'icon': CupertinoIcons.bell,
    },
    {
      'title': 'إنجاز جديد',
      'message': 'أنت الآن في المرتبة 3 في لوحة المتصدرين هذا الأسبوع!',
      'time': '2 يوم',
      'isRead': true,
      'type': 'achievement',
      'icon': CupertinoIcons.chart_bar_alt_fill,
    },
    {
      'title': 'نصيحة بيئية',
      'message': 'هل تعلم؟ إعادة تدوير طن واحد من الورق توفر 17 شجرة.',
      'time': '3 أيام',
      'isRead': true,
      'type': 'tip',
      'icon': CupertinoIcons.lightbulb,
    },
    {
      'title': 'تحدي قادم',
      'message': 'استعد لتحدي المجتمع الخالي من البلاستيك يبدأ غداً.',
      'time': '4 أيام',
      'isRead': true,
      'type': 'challenge',
      'icon': CupertinoIcons.calendar,
    },
  ];

  Color getTypeColor(String type) {
    switch (type) {
      case 'challenge':
        return AppColors.greenColor;
      case 'achievement':
        return AppColors.orangeColor;
      case 'reminder':
        return AppColors.blueColor;
      case 'tip':
        return AppColors.yellowColor;
      default:
        return AppColors.grayColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: AppColors.blackColor),
        ),
        title: Text('الاشعارات', style: AppStyles.bold22Black),
        actions: [
          TextButton(
            onPressed: () {
              // Mark all as read
            },
            child: Row(
              children: [
                Icon(Icons.done_all, color: AppColors.greenColor, size: 20),
                SizedBox(width: 4.w),
                Text('تحديد الكل', style: AppStyles.bold14Black),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.whiteColor,
              AppColors.lightYellowColor.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.darkGreenColor,
                    AppColors.lightGreenColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGreenColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('الكل', '${notifications.length}', CupertinoIcons.bell_fill),
                  _buildStatItem('غير مقروء', '2', CupertinoIcons.circle_fill),
                  _buildStatItem('هذا الأسبوع', '4', CupertinoIcons.calendar_today),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: notifications.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return _buildNotificationItem(notification);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.whiteColor, size: 24),
        SizedBox(height: 4.h),
        Text(value, style: AppStyles.bold20White),
        Text(label, style: AppStyles.light16White),
      ],
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: !notification['isRead']
              ? AppColors.greenColor.withOpacity(0.3)
              : AppColors.transparentColor,
          width: !notification['isRead'] ? 2 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: getTypeColor(notification['type']).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              notification['icon'],
              color: getTypeColor(notification['type']),
              size: 20,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification['title'],
                        style: !notification['isRead']
                            ? AppStyles.bold16Black
                            : AppStyles.bold14Black,
                      ),
                    ),
                    if (!notification['isRead'])
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  notification['message'],
                  style: AppStyles.light14SearchHint,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      color: AppColors.grayColor,
                      size: 12,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      notification['time'],
                      style: AppStyles.light14SearchHint.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: getTypeColor(notification['type']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _getTypeLabel(notification['type']),
                        style: AppStyles.bold14Black.copyWith(
                          fontSize: 10,
                          color: getTypeColor(notification['type']),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTypeLabel(String type) {
    switch (type) {
      case 'challenge':
        return 'تحدي';
      case 'achievement':
        return 'إنجاز';
      case 'reminder':
        return 'تذكير';
      case 'tip':
        return 'نصيحة';
      default:
        return 'عام';
    }
  }
}
