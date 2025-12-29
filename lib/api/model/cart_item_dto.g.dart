// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) => CartItemDto(
  orderId: (json['order_id'] as num?)?.toInt(),
  itemId: (json['item_id'] as num?)?.toInt(),
  estimatedQuantity: (json['estimated_quantity'] as num?)?.toInt(),
  price: json['price'] as String?,
  pointsEarned: (json['points_earned'] as num?)?.toInt(),
  updatedAt: json['updated_at'] as String?,
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartItemDtoToJson(CartItemDto instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'estimated_quantity': instance.estimatedQuantity,
      'price': instance.price,
      'points_earned': instance.pointsEarned,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
