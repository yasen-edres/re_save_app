import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_save_app/features/ui/home/tabs/add_tab/cubit/order_states.dart';

class OrderViewModel extends Cubit<OrderState> {
  OrderViewModel() : super(OrderInitialState());


  void addImage({File? image, Iterable<File>? iterable}) {
    List<File> images = [];
    if (image != null) {
      images.add(image);
    } else {
      images.addAll(iterable!);
    }
    emit(OrderUpdateImagesState(images, state.orderName));
  }

  void removeImage(File image) {
    List<File> updatedImages = List<File>.from(state.images);
    updatedImages.remove(image);
    emit(OrderUpdateImagesState(updatedImages, state.orderName));
  }

  void changeSelectOption(String newOption) {
    emit(OrderUpdateOptionState(newOption, state.images, state.orderName));
  }

  void changeOrderName(String newOrderName) {
    emit(OrderUpdateOrderNameState(
        state.selectedOption, state.images, newOrderName));
  }
}
