import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_states.dart';

class OrderViewModel extends Cubit<OrderState> {
  OrderViewModel() : super(OrderInitialState());
  List<File> images = [];

  void addImage({File? image, Iterable<File>? iterable}) {
    if (image != null) {
      images.add(image);
    } else {
      images.addAll(iterable!);
    }
    emit(OrderUpdateImagesState());
  }

  void removeImage(File image) {
    images.remove(image);
    emit(OrderUpdateImagesState());
  }
}
