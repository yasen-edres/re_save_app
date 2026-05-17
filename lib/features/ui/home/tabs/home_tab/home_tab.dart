import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/core/utils/app_styles.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_state.dart';
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
                          Color(0xFF2E8E68),
                          Color(0xFF144B22),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.w),
                        bottomLeft: Radius.circular(20.w),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF46CA67).withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]
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
                                  ? Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor.withOpacity(0.2),
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  color: AppColors.whiteColor,
                                  size: 30,
                                ),
                              )
                                  : Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.whiteColor,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(user.image!),
                                  backgroundColor: AppColors.transparentColor,
                                ),
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
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor.withOpacity(0.2),
                            ),
                            child: Stack(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.notificationTabRoute);
                                  },
                                  icon: Icon(
                                    CupertinoIcons.bell,
                                    color: AppColors.whiteColor,
                                    size: 28,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.redColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

                    // _buildEnvironmentalImpact(),
                    SizedBox(height: 30.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.lightGreenColor.withOpacity(0.1),
                            AppColors.darkGreenColor.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.grid,
                                color: AppColors.darkGreenColor,
                                size: 24,
                              ),
                              SizedBox(width: 8.w),
                              Text("فئات", style: AppStyles.bold20PrimaryDark,),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                context.read<HomeViewModel>().changeSelectedIndex(1);
                              },
                              child: Row(
                                children: [
                                  Text("عرض المزيد", style: AppStyles.bold16Green,),
                                  SizedBox(width: 4.w),
                                  Icon(
                                    CupertinoIcons.chevron_left,
                                    color: AppColors.lightGreenColor,
                                    size: 16,
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    SizedBox(
                        height: 160.h,
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
                                    Container(
                                      width: 75.w,
                                      height: 75.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.whiteColor,
                                            AppColors.lightGrayColor,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.blackColor.withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            context
                                                .read<CategoryViewModel>()
                                                .categoriesImageList[index]
                                        ),
                                        radius: 35,
                                        backgroundColor: AppColors.transparentColor,
                                      ),
                                    ),
                                    SizedBox(height: 8.h,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.darkGreenColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        context
                                            .read<CategoryViewModel>()
                                            .categories[index + 1],
                                        style: AppStyles.bold14Black,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 16.w,),
                            itemCount: 4
                        )
                    ),
                    SizedBox(height: 25.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.orangeColor.withOpacity(0.1),
                            AppColors.yellowColor.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.flame,
                                color: AppColors.orangeColor,
                                size: 24,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "الأكثر استخداما",
                                style: AppStyles.bold20PrimaryDark,
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                context.read<HomeViewModel>().changeSelectedIndex(1);
                              },
                              child: Row(
                                children: [
                                  Text("عرض المزيد", style: AppStyles.bold16Green,),
                                  SizedBox(width: 4.w),
                                  Icon(
                                    CupertinoIcons.chevron_left,
                                    color: AppColors.lightGreenColor,
                                    size: 16,
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    BlocBuilder<CategoryViewModel, CategoryState>(
                      builder: (context, categoryState) {
                        final categoryViewModel = context.read<CategoryViewModel>();
                        final items = categoryViewModel.items;

                        if (categoryState is CategoryLoadingState) {
                          return SizedBox(
                            height: 520.h,
                            child: GridView.builder(
                              itemCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.h,
                                crossAxisSpacing: 8.w,
                                childAspectRatio: 1 / 1.35,
                              ),
                              itemBuilder: (context, index) {
                                return _buildShimmerCategoryItem();
                              },
                            ),
                          );
                        } else if (categoryState is CategoryErrorState) {
                          return Container(
                            height: 200.h,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.exclamationmark_triangle,
                                    color: AppColors.redColor,
                                    size: 40,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'حدث خطأ في تحميل العناصر',
                                    style: AppStyles.bold16Black,
                                  ),
                                  SizedBox(height: 5.h),
                                  TextButton(
                                    onPressed: () {
                                      categoryViewModel.getItems();
                                    },
                                    child: Text('إعادة المحاولة', style: AppStyles.bold16Green),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          // Show real items if available, otherwise show shimmer placeholders
                          if (items.isNotEmpty) {
                            return SizedBox(
                              height: 510.h,
                              child: GridView.builder(
                                itemCount: 4,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 12.w,
                                  childAspectRatio: 1 / 1.35,
                                ),
                                itemBuilder: (context, index) {
                                  return CategoryItem(item: items[index]);
                                },
                              ),
                            );
                          } else {
                            // Show shimmer placeholders while waiting for data
                            return SizedBox(
                              height: 510.h,
                              child: GridView.builder(
                                itemCount: 4,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 12.w,
                                  childAspectRatio: 1 / 1.35,
                                ),
                                itemBuilder: (context, index) {
                                  return _buildShimmerCategoryItem();
                                },
                              ),
                            );
                          }
                        }
                      },
                    ),

                    SizedBox(height: 40.h,)
                  ],
                ),
              ),
            ),
          );
        }

      },
    );
  }
  Widget _buildEnvironmentalImpact() {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, profileState) {
        final user = context.read<ProfileViewModel>().user;
        final userPoints = user?.points ?? 0;

        // Calculate environmental impact based on points
        final co2Reduced = (userPoints * 0.5).toStringAsFixed(1);
        final waterSaved = (userPoints * 2.3).toStringAsFixed(1);
        final treesSaved = (userPoints ~/ 100).toString();

        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.greenColor.withOpacity(0.1),
                AppColors.lightGreenColor.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.greenColor.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greenColor.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColors.greenColor,
                    size: 24,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'تأثيرك البيئي',
                    style: AppStyles.bold20PrimaryDark,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'بفضل جهودك، ساهمت في حماية بيئتنا:',
                style: AppStyles.light16Gray,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: _buildImpactCard(
                      icon: CupertinoIcons.cloud_fill,
                      title: 'تقليل غازات',
                      value: '$co2Reduced كجم',
                      subtitle: 'CO2',
                      color: AppColors.blueColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildImpactCard(
                      icon: CupertinoIcons.drop_fill,
                      title: 'توفير مياه',
                      value: '$waterSaved لتر',
                      subtitle: 'مياه نقية',
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _buildImpactCard(
                icon: CupertinoIcons.star_circle_fill,
                title: 'أشجار محفوظة',
                value: '$treesSaved شجرة',
                subtitle: 'من القطع',
                color: AppColors.darkGreenColor,
                isFullWidth: true,
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.orangeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      color: AppColors.orangeColor,
                      size: 20,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'نقاطك الحالية: ',
                      style: AppStyles.bold16Black,
                    ),
                    Text(
                      '$userPoints',
                      style: AppStyles.bold20Black.copyWith(
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImpactCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    bool isFullWidth = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              Spacer(),
              if (!isFullWidth)
                Icon(
                  CupertinoIcons.up_arrow,
                  color: color,
                  size: 16,
                ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            value,
            style: AppStyles.bold20Black.copyWith(
              color: color,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: AppStyles.bold14Black,
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: AppStyles.light14SearchHint.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCategoryItem() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.lightGrayColor,
        highlightColor: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 12.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    height: 12.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 14.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(url, fit: BoxFit.cover,),
            ),
          );
        }).toList());
  }
}
