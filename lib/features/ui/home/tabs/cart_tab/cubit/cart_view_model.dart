import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/get_cart_response.dart';
import 'package:re_save_app/domain/usecases/get_cart_use_case.dart';
import 'package:re_save_app/features/ui/home/tabs/cart_tab/cubit/cart_state.dart';

@injectable
class CartViewModel extends Cubit<CartState>{
  final GetCartUseCase getCartUseCase;
  List<Items> items = [];
  CartViewModel({required this.getCartUseCase}):super(CartInitialize());

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
}