import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/widget/category_item.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/home_state.dart';

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
  CategoryViewModel viewModel = CategoryViewModel();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
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
                                backgroundImage: AssetImage(
                                    AppAssets.yassinImage),
                              ),
                              SizedBox(width: 15.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ياسين إدريس',
                                    style: AppStyles.bold24White,),
                                  Text(
                                    'المستوى 3',
                                    style: AppStyles.light16White,),
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
                                  CupertinoIcons.cart,
                                  color: AppColors.whiteColor,
                                  size: 30,),
                              ),

                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.notificationTabRoute);
                                },
                                icon: Icon(
                                  CupertinoIcons.bell,
                                  color: AppColors.whiteColor,
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
                          autoPlayAnimationDuration: Duration(
                              milliseconds: 800),
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
                        TextButton(
                            onPressed: () {
                              //todo: show all categories
                              context.read<HomeViewModel>().changeSelectedIndex(
                                  1);
                            },
                            child: Text(
                              "عرض المزيد", style: AppStyles.bold16Green,)
                        )
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    SizedBox(
                        height: 150.h,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<HomeViewModel>()
                                      .changeSelectedIndex(1);
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          viewModel.categoriesImageList[index]),
                                      radius: 40,
                                    ),
                                    SizedBox(height: 5.h,),
                                    Text(viewModel.categories[index + 1],
                                      style: AppStyles.bold16Black,),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 20.w,),
                            itemCount: 5
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الأكثر استخداما",
                          style: AppStyles.bold20PrimaryDark,),
                        TextButton(
                            onPressed: () {
                              //todo: show all electronicDevices
                              context.read<HomeViewModel>().changeSelectedIndex(
                                  1);
                            },
                            child: Text(
                              "عرض المزيد", style: AppStyles.bold16Green,)
                        )
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
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
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
        },
      ),
    );
  }
}
