import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/widget/get_categories.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CategoryTab extends StatefulWidget {
  CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;
  String searchText = '';
  List<String> categories = [
    'الكل',
    'الالكترونيات',
    'أدوات منزلية',
    'معادن',
    'بلاستيك',
    'عبوات كرتون',
    'ورقيات',
    'قطع غيار',
    'زيوت',
    'اقمشه',
  ];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchText = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomTextFormField(
                hintText: 'البحث في الفئات',
                prefixIcon: Icon(CupertinoIcons.search),
                controller: searchController,
              ),

              DefaultTabController(
                length: categories.length,
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      indicatorColor: AppColors.blackColor,
                      dividerColor: AppColors.transparentColor,
                      isScrollable: true,

                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      tabs: categories
                          .map((e) => Text(e, style: AppStyles.bold20Black))
                          .toList(),
                    ),
                    GetCategories(
                      categoryName: categories[selectedIndex],
                      searchText: searchController.text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
