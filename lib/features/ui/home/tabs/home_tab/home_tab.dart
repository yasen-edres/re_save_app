import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<Widget> asd = [
    Image.asset(AppAssets.learnRecycleCover),
    Image.asset(AppAssets.plasticCover),
    Image.asset(AppAssets.potelCover),

  ];
  List<String> categoriesList = [
    AppAssets.ironImage,
    AppAssets.cartoonImage,
    AppAssets.plasticImage,
    AppAssets.copperImage,
    AppAssets.paperImage,
    AppAssets.plasticImage,
    AppAssets.copperImage,
    AppAssets.paperImage,
  ];
  List<String> categoriesNameList = [
    'حديد',
    'كرتون',
    'بلاستيك',
    'نحاس',
    'ورق',
    'بلاستيك',
    'نحاس',
    'ورق',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.h),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 20.w
            ),
            height: 150.h,
            decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.w),
                  bottomLeft: Radius.circular(16.w),
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ياسين إدريس', style: AppStyles.bold24White,),
                        Text('المستوى 3', style: AppStyles.light16White,),
                      ],
                    ),
                    Icon(
                      Icons.notifications_outlined, color: AppColors.whiteColor,
                      size: 30,)
                  ],
                ),
              ],
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20.w
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("العروض", style: AppStyles.medium18Header,),
                  Text("عرض المزيد", style: AppStyles.bold16Blue,),
                ],
              ),
              CarouselSlider(
                  items: asd,
                  options: CarouselOptions(
                    padEnds: false,
                    height: 200.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("فئات", style: AppStyles.medium18Header,),
                  Text("عرض المزيد", style: AppStyles.bold16Blue,),
                ],
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                height: 350.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 20.h,
                    //   crossAxisCount: 2,
                    // childAspectRatio: 2,
                    // mainAxisSpacing: 30.h,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(categoriesList[index]),
                          radius: 50,
                        ),
                        SizedBox(height: 5.h,),
                        Expanded(child: Text(categoriesNameList[index],
                          style: AppStyles.bold20PrimaryDark,))
                      ],
                    );
                  },
                  itemCount: categoriesList.length,
                  scrollDirection: Axis.horizontal,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
