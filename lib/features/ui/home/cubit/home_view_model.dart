import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_save_app/features/ui/home/cubit/home_state.dart';

class HomeViewModel extends Cubit<HomeState> {
  int selectedIndex = 0;
  int tabIndex = 0;

  HomeViewModel() : super(HomeInitialState());

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(HomeChangeIndexState());
  }
}
