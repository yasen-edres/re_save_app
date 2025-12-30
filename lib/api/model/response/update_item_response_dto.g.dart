// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateItemResponseDto _$UpdateItemResponseDtoFromJson(
  Map<String, dynamic> json,
) => UpdateItemResponseDto(
  id: (json['id'] as num?)?.toInt(),
  orderId: (json['order_id'] as num?)?.toInt(),
  itemId: (json['item_id'] as num?)?.toInt(),
  estimatedQuantity: (json['estimated_quantity'] as num?)?.toInt(),
  actualQuantity: json['actual_quantity'],
  price: json['price'] as String?,
  pointsEarned: (json['points_earned'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  image: json['image'],
);

Map<String, dynamic> _$UpdateItemResponseDtoToJson(
  UpdateItemResponseDto instance,
) => <String, dynamic>{
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
