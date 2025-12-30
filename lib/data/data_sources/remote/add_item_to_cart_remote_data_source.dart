import 'package:re_save_app/domain/entities/request/add_item_to_cart_request.dart';
import 'package:re_save_app/domain/entities/response/add_item_to_cart_response.dart';

abstract class AddItemToCartRemoteDataSource{
  Future<AddItemToCartResponse> addItemToCart(AddItemToCartRequest addItemToCartRequest);
}