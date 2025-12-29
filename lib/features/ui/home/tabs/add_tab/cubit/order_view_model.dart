import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_states.dart';


class OrderViewModel extends Cubit<OrderState> {
  OrderViewModel() : super(OrderInitialize());

  final formKey = GlobalKey<FormState>();
  List<String> cloudImageUrls = [];


  void addImage(String url) {
    cloudImageUrls.add(url);
    emit(OrderSuccess());
  }
}
