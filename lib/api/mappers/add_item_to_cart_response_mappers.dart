import 'package:re_save_app/api/mappers/cart_item_mappers.dart';
import 'package:re_save_app/api/model/response/add_item_to_cart_response_dto.dart';

import '../../domain/entities/response/add_item_to_cart_response.dart';

extension AddItemToCartResponseMappers on AddItemToCartResponseDto{

  AddItemToCartResponse toAddItemToCartResponse(){
    return AddItemToCartResponse(
      message: message,
      cartItem: cartItemDto?.toCartItem(),
      status: status,
    );
}
}