import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_save_app/domain/entities/order_entities.dart';

import 'order_states.dart';


class OrderViewModel extends Cubit<OrderState> {
  OrderViewModel() : super(OrderState.initial());

  final formKey = GlobalKey<FormState>();


  void addImage({File? image, Iterable<File>? images}) {
    //todo: add image ➕.
    final updatedImages = List<File>.from(state.images);

    if (image != null) {
      updatedImages.add(image);
    } else if (images != null) {
      updatedImages.addAll(images);
    }

    emit(state.copyWith(
      images: updatedImages,
      imageError: false,
    ));
  }


  void removeImage(File image) {
    //todo: remove image ❌.
    final updatedImages = List<File>.from(state.images)
      ..remove(image);

    emit(state.copyWith(images: updatedImages));
  }

  void changeSelectOption(String option) {
    //todo: change option 🔁.
    emit(state.copyWith(selectedOption: option));
  }


  void changeOrderName(String name) {
    //todo: change order name ✏️.
    emit(state.copyWith(orderName: name));
  }


  void toggleCheck(bool value) {
    //todo: Checkbox ☑️.
    emit(state.copyWith(
      isCheck: value,
      checkError: false,
    ));
  }


  bool submit(OrderEntity order) {
    final isFormValid = formKey.currentState?.validate() ?? false;
    final hasImages = state.images.isNotEmpty;
    final isChecked = state.isCheck;

    emit(state.copyWith(
      imageError: !hasImages,
      checkError: !isChecked,
    ));

    if (isFormValid && hasImages && isChecked) {
      addOrder(order);
      deleteOrder();
      return true;
    }

    return false;
  }

  void addOrder(OrderEntity order) {
    final orderList = List<OrderEntity>.from(state.orderProgress);
    orderList.add(order);
    emit(state.copyWith(
      orderProgress: orderList,
    ));
  }

  void deleteOrder() {
    emit(state.copyWith(
      images: [],
      selectedOption: 'بلاستيك',
      orderName: '',
      isCheck: false,
    ));
  }
}
