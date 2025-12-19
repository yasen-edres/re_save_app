import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:re_save_app/features/ui/home/cubit/home_state.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
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
  HomeViewModel viewModel = HomeViewModel();
  String searchText = '';


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
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
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
                      length: viewModel.categories.length,
                      child: Column(
                        children: [
                          TabBar(
                            tabAlignment: TabAlignment.start,
                            indicatorColor: AppColors.blackColor,
                            dividerColor: AppColors.transparentColor,
                            isScrollable: true,

                            onTap: (index) {
                              viewModel.changeTabIndex(index);
                              print(index);
                            },
                            tabs: viewModel.categories
                                .map((e) =>
                                Text(e, style: AppStyles.bold20Black))
                                .toList(),
                          ),
                          GetCategories(
                            categoryName: viewModel.categories[state.tabIndex],
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
        },
      ),
    );
  }
}
