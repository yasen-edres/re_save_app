class HomeState {
  final int selectedIndex;

  const HomeState({this.selectedIndex = 0});
}

class HomeChangeIndexState extends HomeState {
  const HomeChangeIndexState({required int selectedIndex})
    : super(selectedIndex: selectedIndex);
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(selectedIndex: 0);
}
