import 'package:re_save_app/api/model/cart_item_dto.dart';
import 'package:re_save_app/domain/entities/response/cart_item.dart';

extension CartItemMappers on CartItemDto{

  CartItem toCartItem(){
    return CartItem(
      itemId: itemId,
      estimatedQuantity: estimatedQuantity,
      price: price,
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      orderId: orderId,
      pointsEarned: pointsEarned,
    );
  }
}