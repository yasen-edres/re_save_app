import 'package:re_save_app/domain/entities/request/cart/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/cart/add_item_to_cart_response.dart';

abstract class AddItemToCartRepository{
  Future<AddItemToCartResponse> addItemToCart(AddItemToCartRequest addItemToCartRequest);
}