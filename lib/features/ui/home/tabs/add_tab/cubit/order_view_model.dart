import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/usecases/add_item_to_cart_use_case.dart';

import 'order_states.dart';

@injectable
class OrderViewModel extends Cubit<OrderState> {
  AddItemToCartUseCase addItemToCartUseCase;


  OrderViewModel({required this.addItemToCartUseCase}) : super(OrderInitialize());

  final formKey = GlobalKey<FormState>();
  List<String> cloudImageUrls = [];


  void addImage(String url) {
    cloudImageUrls.add(url);
    emit(OrderSuccess());
  }
  void addItemToCart(AddItemToCartRequest addItemToCartRequest) async{
    emit(OrderLoading());
    final response = await addItemToCartUseCase.invoke(addItemToCartRequest);
    emit(OrderSuccess(messageSuccess: response.message));
  }

}
