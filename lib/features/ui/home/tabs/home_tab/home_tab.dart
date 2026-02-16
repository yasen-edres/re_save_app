import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/widget/category_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../profile_tab/cubit/profile_state.dart';
import '../profile_tab/cubit/profile_view_model.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> eventsCover = [
    AppAssets.learnRecycleCover,
    AppAssets.potelCover,

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileViewModel>().getUserData();
      context.read<CategoryViewModel>().getItems();
    });
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, state) {
        final viewModel = context.read<ProfileViewModel>();
        final user = viewModel.user;
        if (state is ProfileLoading) {
          //todo:loading
          return Center(
            child: Shimmer.fromColors(
                baseColor: AppColors.lightGrayColor,
                highlightColor: AppColors.whiteColor,
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Container(
                      width: double.infinity,
                      height: 190.h,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(height: 20.h,),
                    SizedBox(
                      height: 150.h,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.whiteColor,
                                );
                          },
                          separatorBuilder: (context, index) => SizedBox(width: 25.w,),
                          itemCount: 5
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 5.w,
                            childAspectRatio: 1 / 1.5,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: 75.h,
                              color: AppColors.whiteColor,
                            );
                          },
                        ),
                    )
                  ],
                )
            ),
          );
        } else if (state is ProfileError) {
          return Center(
            child: Text(state.errorMessage, style: AppStyles.bold24White,),
          );
        } else {
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
                              user?.image == null || user!.image!.isEmpty
                                  ? CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.lightGrayColor,
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  color: AppColors.whiteColor,
                                  size: 30,
                                ),
                              )
                                  : CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(user.image!),
                                backgroundColor: AppColors.lightGrayColor,
                              ),
                              SizedBox(width: 15.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user?.name ?? 'مرحبا',
                                    style: AppStyles.bold24White,),
                                  Text(
                                    user?.level ?? 'مبتدي',
                                    style: AppStyles.light16White,),
                                ],
                              ),
                            ],
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
                    SizedBox(height: 20.h,),
                    _buildAnnouncement(images: eventsCover),
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
                                      .read<CategoryViewModel>()
                                      .changeTabIndex(
                                      index + 1);
                                  context
                                      .read<HomeViewModel>()
                                      .changeSelectedIndex(1);
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          context
                                              .read<CategoryViewModel>()
                                              .categoriesImageList[index]
                                      ),
                                      radius: 40,
                                    ),
                                    SizedBox(height: 5.h,),
                                    Text(context
                                        .read<CategoryViewModel>()
                                        .categories[index + 1],
                                      style: AppStyles.bold16Black,),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 20.w,),
                            itemCount: 4
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
                      height: 530.h,
                      child: GridView.builder(
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 5.w,
                          childAspectRatio: 1 / 1.4,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            item: context.read<CategoryViewModel>().items[index]//this items not display in first run display in the secound run
                            ,);
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

      },
    );
  }
  ImageSlideshow _buildAnnouncement({ required List<String> images,}) {
    return ImageSlideshow(
        indicatorColor: AppColors.darkGreenColor,
        initialPage: 0,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5,
        indicatorBackgroundColor: AppColors.whiteColor,
        isLoop: true,
        // autoPlayInterval: 5000,
        height: 190.h,
        children: images.map((url) {
          return Image.asset(url, fit: BoxFit.fill,);
        }).toList());
  }
}
