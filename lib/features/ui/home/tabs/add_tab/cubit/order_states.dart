import 'dart:io';

class OrderState {
  final List<File> images;
  final List<String> options;
  final String selectedOption;
  final String orderName;

  OrderState(this.images, this.options, this.selectedOption, this.orderName);
}

class OrderInitialState extends OrderState {
  OrderInitialState() :super(
      [],
      [
        'بلاستيك',
        'الالكترونيات',
        'أدوات منزلية',
        'معادن',
        'عبوات كرتون',
        'ورقيات',
        'قطع غيار',
        'زيوت',
        'اقمشه',
      ],
      'بلاستيك',
      ''
  );
}

class OrderUpdateImagesState extends OrderState {
  OrderUpdateImagesState(List<File> images, String orderName) :super(images,
    [
      'بلاستيك',
      'الالكترونيات',
      'أدوات منزلية',
      'معادن',
      'عبوات كرتون',
      'ورقيات',
      'قطع غيار',
      'زيوت',
      'اقمشه',
    ],
    'بلاستيك',
    orderName,

  );
}

class OrderUpdateOptionState extends OrderState {
  OrderUpdateOptionState(String newOption, List<File> oldImages,
      String orderName) :super(
      oldImages,
      [
        'بلاستيك',
        'الالكترونيات',
        'أدوات منزلية',
        'معادن',
        'عبوات كرتون',
        'ورقيات',
        'قطع غيار',
        'زيوت',
        'اقمشه',
      ],
      newOption,
      orderName


  );
}

class OrderUpdateOrderNameState extends OrderState {
  OrderUpdateOrderNameState(String oldOption, List<File> oldImages,
      String orderName) :super(
      oldImages,
      [
        'بلاستيك',
        'الالكترونيات',
        'أدوات منزلية',
        'معادن',
        'عبوات كرتون',
        'ورقيات',
        'قطع غيار',
        'زيوت',
        'اقمشه',
      ],
      oldOption,
      orderName

  );
}
