import '../../../../../../core/utils/app_assets.dart';

class CategoryState {
  final List<String> categories;
  final List<String> categoriesImageList;
  final int tabIndex;

  CategoryState(
      {required this.tabIndex, required this.categoriesImageList, required this.categories});
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState() :super(
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
  CategoryChangeTabIndex(int newTabIndex) :super(
    tabIndex: newTabIndex,
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
