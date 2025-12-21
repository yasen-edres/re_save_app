import 'dart:io';

class OrderState {
  final List<File> images;
  final List<String> options;
  final String selectedOption;
  final String orderName;
  final bool imageError;
  final bool checkError;
  final bool isCheck;

  OrderState({
    required this.images,
    required this.options,
    required this.selectedOption,
    required this.orderName,
    required this.imageError,
    required this.checkError,
    required this.isCheck,
  });

  factory OrderState.initial() {
    return OrderState(
      images: [],
      options: const [
        'بلاستيك',
        'الالكترونيات',
        'أدوات منزلية',
        'معادن',
        'عناصر متنوعه',
        'عبوات كرتون',
        'ورقيات',
        'قطع غيار',
        'زيوت',
        'اقمشه',
      ],
      selectedOption: 'بلاستيك',
      orderName: '',
      imageError: false,
      checkError: false,
      isCheck: false,
    );
  }

  OrderState copyWith({
    List<File>? images,
    String? selectedOption,
    String? orderName,
    bool? imageError,
    bool? checkError,
    bool? isCheck,
  }) {
    return OrderState(
      images: images ?? this.images,
      options: options,
      selectedOption: selectedOption ?? this.selectedOption,
      orderName: orderName ?? this.orderName,
      imageError: imageError ?? this.imageError,
      checkError: checkError ?? this.checkError,
      isCheck: isCheck ?? this.isCheck,
    );
  }
}