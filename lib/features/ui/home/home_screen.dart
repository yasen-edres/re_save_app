import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/core/utils/app_routes.dart';
import 'package:re_save_app/features/ui/home/cubit/home_view_model.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/category_tab.dart';
import 'package:re_save_app/features/ui/home/tabs/challenge_tab/challenge_tab.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/home_tab.dart';
import 'package:re_save_app/features/ui/home/tabs/profile_tab/profile_tab.dart';

import 'cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeViewModel viewModel = HomeViewModel();

  final List<Widget> tabsList = [
    HomeTab(),
    CategoryTab(),
    ChallengeTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
          final selectedIndex = state.selectedIndex;
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                context.read<HomeViewModel>().changeSelectedIndex(index);
              },
              items: [
                builtBottomNavItem(
                  selectedIndex: selectedIndex,
                  selectedIconName: Image.asset(
                    AppAssets.homeIcon,
                    color: AppColors.lightGreenColor,
                  ),
                  unSelectedIconName: Image.asset(
                    AppAssets.homeIcon,
                    color: AppColors.blackColor,
                  ),
                  label: 'الرئيسية',
                  index: 0,
                ),
                builtBottomNavItem(
                  selectedIndex: selectedIndex,
                  selectedIconName: Image.asset(
                    AppAssets.categoryIcon,
                    color: AppColors.lightGreenColor,
                  ),
                  unSelectedIconName: Image.asset(
                    AppAssets.categoryIcon,
                    color: AppColors.blackColor,
                  ),
                  label: 'الفئات',
                  index: 1,
                ),
                builtBottomNavItem(
                  selectedIndex: selectedIndex,
                  selectedIconName: const Icon(
                    Icons.emoji_events_outlined,
                    color: AppColors.lightGreenColor,
                    size: 28,
                  ),
                  unSelectedIconName: const Icon(
                    Icons.emoji_events_outlined,
                    color: AppColors.blackColor,
                    size: 28,
                  ),
                  label: 'تحدّي',
                  index: 2,
                ),
                builtBottomNavItem(
                  selectedIndex: selectedIndex,
                  selectedIconName: Image.asset(
                    AppAssets.profileIcon,
                    color: AppColors.lightGreenColor,
                  ),
                  unSelectedIconName: Image.asset(
                    AppAssets.profileIcon,
                    color: AppColors.blackColor,
                  ),
                  label: 'الحساب',
                  index: 3,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.addTabRoute);
              },
              child: const Icon(
                  Icons.add, size: 30, color: AppColors.whiteColor),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            body: tabsList[selectedIndex],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem builtBottomNavItem({
    required int selectedIndex,
    required Widget selectedIconName,
    required Widget unSelectedIconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? selectedIconName
          : unSelectedIconName,
      label: label,
    );
  }
}