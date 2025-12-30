// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmItemsDto _$ConfirmItemsDtoFromJson(Map<String, dynamic> json) =>
    ConfirmItemsDto(
      id: (json['id'] as num?)?.toInt(),
      orderId: (json['order_id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      estimatedQuantity: json['estimated_quantity'] as String?,
      actualQuantity: json['actual_quantity'],
      price: json['price'] as String?,
      pointsEarned: (json['points_earned'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      image: json['image'],
    );

Map<String, dynamic> _$ConfirmItemsDtoToJson(ConfirmItemsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'estimated_quantity': instance.estimatedQuantity,
      'actual_quantity': instance.actualQuantity,
      'price': instance.price,
      'points_earned': instance.pointsEarned,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'image': instance.image,
    };
