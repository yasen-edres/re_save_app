import '../../../../../../core/utils/app_assets.dart';

class CategoryState {
  final int tabIndex;
  final List<String> categories;
  final List<String> categoriesImageList;

  CategoryState({
    required this.tabIndex,
    required this.categories,
    required this.categoriesImageList,
  });
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState()
    : super(
        tabIndex: 0,
    categories: [
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
    ],
    categoriesImageList: [
      AppAssets.laptop,
      AppAssets.fridge,
      AppAssets.iron,
      AppAssets.plastic,
      AppAssets.carton,
      AppAssets.paper,
      AppAssets.carBattery,
      AppAssets.carOil,
      AppAssets.cloths,
    ],
  );
}

class CategoryChangeTabIndex extends CategoryState {
  CategoryChangeTabIndex(int tabIndex)
    : super(
        tabIndex: tabIndex,
        categories: [
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
    ],
    categoriesImageList: [
      AppAssets.laptop,
      AppAssets.fridge,
      AppAssets.iron,
      AppAssets.plastic,
      AppAssets.carton,
      AppAssets.paper,
      AppAssets.carBattery,
      AppAssets.carOil,
      AppAssets.cloths,
    ],
  );
}