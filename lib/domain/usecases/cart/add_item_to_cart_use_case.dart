import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/cart/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/cart/add_item_to_cart_response.dart';
import 'package:re_save_app/domain/repositories/cart/add_item_to_cart_repository.dart';

@injectable
class AddItemToCartUseCase{
  AddItemToCartRepository addItemToCartRepository;

  AddItemToCartUseCase({required this.addItemToCartRepository});

  Future<AddItemToCartResponse> invoke(AddItemToCartRequest addItemToCartRequest){
    return addItemToCartRepository.addItemToCart(addItemToCartRequest);

  }
}