import 'package:re_save_app/domain/entities/response/public/item.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {
  final List<Item> items;
  final int tabIndex;

  CategorySuccessState({
    required this.items,
    required this.tabIndex,
  });
}

class CategoryErrorState extends CategoryState {
  final String message;

  CategoryErrorState(this.message);
}

class CategoryChangeTabIndexState extends CategoryState {
  final int tabIndex;

  CategoryChangeTabIndexState(this.tabIndex);
}