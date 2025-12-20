import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_assets.dart';
import 'category_state.dart';

class CategoryViewModel extends Cubit<CategoryState> {
  CategoryViewModel() : super(CategoryInitialState());
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

  List<String> categoriesImageList = [
    AppAssets.laptop,
    AppAssets.fridge,
    AppAssets.iron,
    AppAssets.plastic,
    AppAssets.carton,
    AppAssets.paper,
    AppAssets.carBattery,
    AppAssets.carOil,
    AppAssets.cloths,
  ];
  int tabIndex = 0;

  void changeTbIndex(int newIndex) {
    tabIndex = newIndex;
    emit(CategoryChangeTabIndex());
  }

  void getTbIndex() {
    tabIndex;
    emit(CategoryChangeTabIndex());
  }
}
