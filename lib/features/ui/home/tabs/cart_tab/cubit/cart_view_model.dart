import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/cart/confirm_request.dart';
import 'package:re_save_app/domain/entities/request/cart/update_item_request.dart';
import 'package:re_save_app/domain/entities/response/cart/get_cart_response.dart';
import 'package:re_save_app/domain/usecases/cart/confirm_use_cse.dart';
import 'package:re_save_app/domain/usecases/cart/get_cart_use_case.dart';
import 'package:re_save_app/domain/usecases/cart/remove_item_use_case.dart';
import 'package:re_save_app/domain/usecases/cart/update_item_use_case.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_state.dart';

import '../../../../../../core/exceptions/app_exception.dart';

@injectable
class CartViewModel extends Cubit<CartState>{
  final GetCartUseCase getCartUseCase;
  RemoveItemUseCase removeItemUseCase;
  UpdateItemUseCase updateItemUseCase;
  ConfirmUseCase confirmUseCase;
  List<Items> items = [];
  String? cartMessage;
  CartViewModel({required this.getCartUseCase, required this.removeItemUseCase, required this.updateItemUseCase, required this.confirmUseCase}):super(CartInitialize());

  void getCart() async {
    emit(CartLoading());
    try {
      final response = await getCartUseCase.getCart();
      items = response.data?.items ?? [];
      cartMessage = response.message;
      emit(CartSuccess());
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }
  void removeItem(int itemId)async{
    emit(CartLoading());
    try{
       await removeItemUseCase.invoke(itemId);
      emit(CartSuccess());
      getCart();
    } on AppException catch (e) {
      emit(CartError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(CartError(errorMessage: message));
    }
  }
  void updateItem(UpdateItemRequest updateItemRequest,int itemId) async {
    emit(CartLoading());
    try {
      await updateItemUseCase.invoke(updateItemRequest, itemId);

      emit(CartSuccess());
      getCart();
    }  on AppException catch (e) {
      emit(CartError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(CartError(errorMessage: message));
    }
  }
  void confirm(String address) async {
    emit(CartLoading());
    try {
      final confirmRequest = ConfirmRequest(address: address);
      await confirmUseCase.invoke(confirmRequest);
      getCart();
    } on AppException catch (e) {
      emit(CartError(errorMessage: e.toString()));
    } on DioError catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'unExpected Error occurred';
      emit(CartError(errorMessage: message));
    }
  }

}