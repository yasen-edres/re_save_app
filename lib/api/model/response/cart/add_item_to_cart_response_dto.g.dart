// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddItemToCartResponseDto _$AddItemToCartResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddItemToCartResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  cartItemDto: json['data'] == null
      ? null
      : CartItemDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddItemToCartResponseDtoToJson(
  AddItemToCartResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.cartItemDto,
};
