import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/widget/category_item.dart';

import '../../../../../core/utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<Widget> eventsCover = [
    Image.asset(AppAssets.learnRecycleCover),
    Image.asset(AppAssets.potelCover),

  ];
  List<String> electronicDevicesImage = [
    AppAssets.refrigeratorImage,
    AppAssets.refrigeratorImage,
    AppAssets.refrigeratorImage,
    AppAssets.refrigeratorImage,
    AppAssets.refrigeratorImage,
  ];
  List<String> electronicDevicesTitle = [
    'ثلاجة',
    'ثلاجة',
    'ثلاجة',
    'ثلاجة',
    'ثلاجة',
  ];
  List<String> electronicDevicesDescription = [
    'هذا هو الوصف',
    'هذا هو الوصف',
    'هذا هو الوصف',
    'هذا هو الوصف',
    'هذا هو الوصف',
  ];
  List<double> electronicDevicesPrice = [
    100,
    200,
    300,
    400,
    500,
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
            height: 130.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF46CA67),
                    Color(0xFF144B22),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                ),
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
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(AppAssets.yassinImage),
                        ),
                        SizedBox(width: 15.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ياسين إدريس', style: AppStyles.bold24White,),
                            Text('المستوى 3', style: AppStyles.light16White,),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            CupertinoIcons.cart, color: AppColors.whiteColor,
                            size: 30,),
                        ),

                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                AppRoutes.notificationTabRoute);
                          },
                          icon: Icon(
                            CupertinoIcons.bell, color: AppColors.whiteColor,
                            size: 30,),
                        )

                      ],
                    )
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
              CarouselSlider(
                  items: eventsCover,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      //todo: show all details
                    },
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
                  Text("فئات", style: AppStyles.bold20PrimaryDark,),
                  InkWell(
                      onTap: () {
                        //todo: show all categories
                      },
                      child: Text("عرض المزيد", style: AppStyles.bold16Green,)),
                ],
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                  height: 150.h,
                  child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  categoriesList[index]),
                              radius: 40,
                            ),
                            SizedBox(height: 5.h,),
                            Text(categoriesNameList[index],
                              style: AppStyles.bold16Black,),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 20.w,),
                      itemCount: categoriesList.length
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الأكثر استخداما", style: AppStyles.bold20PrimaryDark,),
                  InkWell(
                      onTap: () {
                        //todo: show all electronicDevices
                      },
                      child: Text("عرض المزيد", style: AppStyles.bold16Green,)),
                ],
              ),
              SizedBox(height: 10.h,),
              SizedBox(
                height: 730.h,
                child: GridView.builder(
                  itemCount: electronicDevicesDescription.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 18.w,
                    childAspectRatio: 1 / 1.25,
                  ),
                  itemBuilder: (context, index) {
                      return CategoryItem(
                          title: electronicDevicesTitle[index],
                          image: electronicDevicesImage[index],
                          price: electronicDevicesPrice[index],
                          description: electronicDevicesDescription[index]
                      );
                    },
                ),
              ),

              SizedBox(height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
