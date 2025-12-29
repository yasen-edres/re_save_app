import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/item.dart';
import 'package:re_save_app/domain/usecases/get_items_use_case.dart';

import '../../../../../../core/utils/app_assets.dart';
import 'category_state.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryState> {
  GetItemsUseCase getItemsUseCase;
  List<String> categories = [
    'الكل',
    'معادن',
    'بلاستيك',
    'ورقيات',
    'اجهزه',
    'اخري'
  ];
  List<Item> items = [];


  List<String> categoriesImageList = [
    AppAssets.iron,
    AppAssets.plastic,
    AppAssets.paper,
    AppAssets.fridge,

  ];

  int tabIndex = 0;

  CategoryViewModel({required this.getItemsUseCase})
      : super(CategoryInitialState());

  void changeTabIndex(int newTabIndex) {
    emit(CategoryLoadingState());
    tabIndex = newTabIndex;
    emit(CategoryChangeTabIndexState(tabIndex));
  }

  Future<void> getItems() async {
    emit(CategoryInitialState());

    try {
      final response = await getItemsUseCase.invoke();

      items = response.items ?? [];

      emit(CategorySuccessState(items: items, tabIndex: tabIndex));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }
}