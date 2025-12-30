import 'package:re_save_app/api/model/confirm_items_dto.dart';
import 'package:re_save_app/domain/entities/response/confirm_items.dart';

extension ConfirmitemsMappers on ConfirmItemsDto{

  ConfirmItems toConfirmItems(){
    return ConfirmItems(
      updatedAt: updatedAt,
      id: id,
      createdAt: createdAt,
      estimatedQuantity: estimatedQuantity,
      price: price,
      image: image,
      actualQuantity: actualQuantity,
      orderId: orderId,
      pointsEarned: pointsEarned,
      itemId: itemId
    );
  }

}