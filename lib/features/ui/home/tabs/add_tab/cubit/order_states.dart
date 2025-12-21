import 'dart:io';

import 'package:re_save_app/domain/entities/order_entities.dart';

class OrderState {
  final List<File> images;
  final List<OrderEntity> orderProgress;
  final List<OrderEntity> orderReceived;
  final List<OrderEntity> orderCancelled;
  final List<String> orderState;
  final List<String> options;
  final String selectedOption;
  final String orderName;
  final bool imageError;
  final bool checkError;
  final bool isCheck;

  OrderState({
    required this.images,
    required this.options,
    required this.orderProgress,
    required this.orderReceived,
    required this.orderState,
    required this.orderCancelled,
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
        orderProgress: [],
        orderCancelled: [],
        orderReceived: [],
        orderState: ['قيد التنفيذ', 'المستلمه', 'الملغاه']
    );
  }

  OrderState copyWith({
    List<File>? images,
    String? selectedOption,
    String? orderName,
    bool? imageError,
    bool? checkError,
    bool? isCheck,
    List<OrderEntity>? orderProgress,
    List<OrderEntity>? orderReceived,
    List<OrderEntity>? orderCancelled,
  }) {
    return OrderState(
      images: images ?? this.images,
      options: options,
      selectedOption: selectedOption ?? this.selectedOption,
      orderName: orderName ?? this.orderName,
      imageError: imageError ?? this.imageError,
      checkError: checkError ?? this.checkError,
      isCheck: isCheck ?? this.isCheck,
      orderProgress: orderProgress ?? this.orderProgress,
      orderCancelled: orderCancelled ?? this.orderCancelled,
      orderReceived: orderReceived ?? this.orderReceived,
      orderState: orderState,
    );
  }
}