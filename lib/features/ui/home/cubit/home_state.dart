class HomeState {
  final int selectedIndex;
  final int tabIndex;

  const HomeState({this.selectedIndex = 0, this.tabIndex = 0});
}

class HomeChangeIndexState extends HomeState {
  const HomeChangeIndexState({required int selectedIndex})
    : super(selectedIndex: selectedIndex);
}

class HomeChangeTabIndexState extends HomeState {
  HomeChangeTabIndexState({required int newIndex}) :super(tabIndex: newIndex,

  );
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(
    selectedIndex: 0,
    tabIndex: 0,
  );
}
