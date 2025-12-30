import 'package:re_save_app/api/model/request/add_item_to_cart_request_dto.dart';

import '../../domain/entities/request/add_item_to_cart_request.dart';

extension AddItemToCartRequestMappers on AddItemToCartRequest{

  AddItemToCartRequestDto toAddItemToCartRequestDto(){
    return AddItemToCartRequestDto(
      estimatedQuantity: estimatedQuantity,
      itemId: itemId,
      image: image,
    );
  }
}