import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_save_app/features/ui/home/cubit/home_state.dart';

class HomeViewModel extends Cubit<HomeState> {

  HomeViewModel() : super(HomeInitialState());

  void changeSelectedIndex(int index) {
    emit(HomeChangeIndexState(selectedIndex: index));
  }

  void changeTabIndex(int index) {
    emit(HomeChangeTabIndexState(newIndex: index,));
  }

}
