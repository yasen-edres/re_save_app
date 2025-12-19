class HomeState {
  final int selectedIndex;
  final int tabIndex;
  final List<String> categories;

  const HomeState(
      {this.selectedIndex = 0, this.categories = const [], this.tabIndex = 0});
}

class HomeChangeIndexState extends HomeState {
  const HomeChangeIndexState({required int selectedIndex})
    : super(selectedIndex: selectedIndex);
}

class HomeChangeTabIndexState extends HomeState {
  HomeChangeTabIndexState({required int newIndex}) :super(tabIndex: newIndex,
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
  );
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(
    selectedIndex: 0,
    categories: const [
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
    tabIndex: 0,
  );
}
