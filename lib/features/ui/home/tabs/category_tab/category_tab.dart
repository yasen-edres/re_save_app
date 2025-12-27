import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_state.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/cubit/category_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/widget/get_categories.dart';
import 'package:re_save_app/features/widget/custom_text_form_field.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CategoryTab extends StatefulWidget {
  CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  late TabController tabController;


  @override
  void initState() {
    super.initState();

    final categoryLength = context
        .read<CategoryViewModel>()
        .state
        .categories
        .length;
    tabController = TabController(
      length: categoryLength,
      vsync: this,
    );
    searchController.addListener(() {
      setState(() {
        searchText = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryViewModel, CategoryState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (tabController.index != state.tabIndex) {
            tabController.animateTo(state.tabIndex);
          }
        });

        ///this code work after build
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
                  TabBar(
                    controller: tabController,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: AppColors.blackColor,
                    dividerColor: AppColors.transparentColor,
                    isScrollable: true,
                    onTap: (index) {
                      context.read<CategoryViewModel>().changeTabIndex(index);
                    },
                    tabs: state.categories
                        .map((e) =>
                        Text(e, style: AppStyles.bold20Black))
                        .toList(),
                  ),
                  GetCategories(
                    categoryName: state.categories[state.tabIndex],
                    searchText: searchController.text,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
