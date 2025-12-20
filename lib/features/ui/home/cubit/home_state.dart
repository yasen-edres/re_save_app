abstract class HomeState {
  final int selectedIndex;

  HomeState(this.selectedIndex);
}

class HomeInitialState extends HomeState {
  HomeInitialState() : super(0);
}

class HomeChangeIndexState extends HomeState {
  HomeChangeIndexState(int index) : super(index);
}