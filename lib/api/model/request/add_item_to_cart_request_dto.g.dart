// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_to_cart_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddItemToCartRequestDto _$AddItemToCartRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddItemToCartRequestDto(
  itemId: (json['item_id'] as num?)?.toInt(),
  estimatedQuantity: (json['estimated_quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$AddItemToCartRequestDtoToJson(
  AddItemToCartRequestDto instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'estimated_quantity': instance.estimatedQuantity,
};
