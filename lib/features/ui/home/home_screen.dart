import 'package:flutter/material.dart';
import 'package:re_save_app/core/utils/app_assets.dart';
import 'package:re_save_app/core/utils/app_colors.dart';
import 'package:re_save_app/features/ui/home/tabs/category_tab/category_tab.dart';
import 'package:re_save_app/features/ui/home/tabs/challenge_tab/challenge_tab.dart';
import 'package:re_save_app/features/ui/home/tabs/home_tab/home_tab.dart';
import 'package:re_save_app/features/ui/home/tabs/profile_tab/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    HomeTab(),
    CategoryTab(),
    ChallengeTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          builtBottomNavItem(
            selectedIconName: Image.asset(
              AppAssets.homeIcon,
              color: AppColors.blackColor,
            ),
            unSelectedIconName: Image.asset(
              AppAssets.homeIcon,
              color: AppColors.greenColor,
            ),
            label: 'الرئيسية',
            index: 0,
          ),
          builtBottomNavItem(
            selectedIconName: Image.asset(
              AppAssets.categoryIcon,
              color: AppColors.blackColor,
            ),
            unSelectedIconName: Image.asset(
              AppAssets.categoryIcon,
              color: AppColors.greenColor,
            ),
            label: 'الفئات',
            index: 1,
          ),
          builtBottomNavItem(
            selectedIconName: Icon(
              Icons.emoji_events_outlined,
              color: AppColors.blackColor,
              size: 28,
            ),
            unSelectedIconName: Icon(
              Icons.emoji_events_outlined,
              color: AppColors.greenColor,
              size: 28,
            ),
            label: 'تحدّي',
            index: 2,
          ),
          builtBottomNavItem(
            selectedIconName: Image.asset(
              AppAssets.profileIcon,
              color: AppColors.blackColor,
            ),
            unSelectedIconName: Image.asset(
              AppAssets.profileIcon,
              color: AppColors.greenColor,
            ),
            label: 'الحساب',
            index: 3,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo: Navigate to add Event.
        },
        child: Icon(Icons.add, size: 30, color: AppColors.whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabsList[selectedIndex],
    );
  }

  BottomNavigationBarItem builtBottomNavItem({
    required Widget selectedIconName,
    required Widget unSelectedIconName,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index ? unSelectedIconName : selectedIconName,
      label: label,
    );
  }
}
