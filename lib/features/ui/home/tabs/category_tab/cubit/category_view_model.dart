import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_state.dart';

class CategoryViewModel extends Cubit<CategoryState> {
  CategoryViewModel() : super(CategoryInitialState());

  void changeTbIndex(int newTabIndex) {
    emit(CategoryChangeTabIndex(newTabIndex));
  }

}
