import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/get_cart_response.dart';
import 'package:re_save_app/domain/usecases/get_cart_use_case.dart';
import 'package:re_save_app/domain/usecases/remove_item_use_case.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_state.dart';

import '../../../../../../core/exceptions/app_exception.dart';

@injectable
class CartViewModel extends Cubit<CartState>{
  final GetCartUseCase getCartUseCase;
  RemoveItemUseCase removeItemUseCase;
  List<Items> items = [];
  CartViewModel({required this.getCartUseCase, required this.removeItemUseCase}):super(CartInitialize());

  void getCart() async{
    emit(CartLoading());
    try{
      final response = await getCartUseCase.getCart();
      items = response.data!.items!;
      emit(CartSuccess());
    }catch(e){
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
      emit(CartError(errorMessage: e.toString()));
    }

  }
}