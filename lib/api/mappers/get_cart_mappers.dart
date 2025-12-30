import 'package:re_save_app/api/model/response/get_cart_response_dto.dart';

import '../../domain/entities/response/get_cart_response.dart';

extension GetCartMappers on GetCartResponseDto{

  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      status: status,
      data: data?.toData(),
      message: message
    );
  }
}

extension DataMappers on DataDto {
  Data toData() {
    return Data(
      status: status,
      updatedAt: updatedAt,
      id: id,
      createdAt: createdAt,
      address: address,
      latitude: latitude,
      longitude: longitude,
      riderId: riderId,
      scheduledAt: scheduledAt,
      totalPoints: totalPoints,
      totalQuantity: totalQuantity,
      userId: userId,
      items: items?.map((e) => e.toItems()).toList(),
    );
  }
}


extension ItemsMappers on ItemsDto{

  Items toItems(){
    return Items(
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      itemId: itemId,
      estimatedQuantity: estimatedQuantity,
      pointsEarned: pointsEarned,
      orderId: orderId,
      price: price,
      image: image,
      actualQuantity: actualQuantity,
      item: item?.toItem(),
    );
  }
}

extension ItemMappers on ItemDto{

  Item toItem(){
     return Item(
       image: image,
       price: price,
       updatedAt: updatedAt,
       id: id,
       createdAt: createdAt,
       pricingType: pricingType,
       isActive: isActive,
       description: description,
       category: category,
       name: name,
     );
  }
}