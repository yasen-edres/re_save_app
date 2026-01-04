import 'package:re_save_app/api/mappers/cart/confirmItemsList_Mappers.dart';
import 'package:re_save_app/api/model/confirm_order_dto.dart';
import 'package:re_save_app/domain/entities/response/cart/confirm_order.dart';
extension ConfirmorderMappers on ConfirmOrderDto{

  ConfirmOrder toConfirmOrder(){
    return ConfirmOrder(
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      userId: userId,
      totalQuantity: totalQuantity,
      totalPoints: totalPoints,
      scheduledAt: scheduledAt,
      riderId: riderId,
      longitude: longitude,
      latitude: latitude,
      address: address,
      items: items?.toConfirmItems(),
      status: status,
    );
  }
}