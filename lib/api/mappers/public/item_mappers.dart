import 'package:re_save_app/api/model/item_dto.dart';
import 'package:re_save_app/domain/entities/response/public/item.dart';

extension ItemMappers on ItemDto {
  Item toItem() {
    return Item(
      name: name,
      image: image,
      updatedAt: updatedAt,
      id: id,
      category: category,
      description: description,
      createdAt: createdAt,
      isActive: isActive,
      price: price,
      pricingType: pricingType,
    );
  }
}
