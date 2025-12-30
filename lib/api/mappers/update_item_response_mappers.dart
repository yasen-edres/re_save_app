import 'package:re_save_app/api/model/response/update_item_response_dto.dart';

import '../../domain/entities/response/update_item_response.dart';

extension UpdateItemResponseMappers on UpdateItemResponseDto{

  UpdateItemResponse toUpdateItemResponse(){
    return UpdateItemResponse(
      itemId: itemId,
      pointsEarned: pointsEarned,
      orderId: orderId,
      actualQuantity: actualQuantity,
      image: image,
      price: price,
      updatedAt: updatedAt,
      id: id,
      createdAt: createdAt,
      estimatedQuantity: estimatedQuantity,
    );
  }
}