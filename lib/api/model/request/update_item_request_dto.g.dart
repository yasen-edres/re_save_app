// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_item_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateItemRequestDto _$UpdateItemRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateItemRequestDto(
  estimatedQuantity: (json['estimated_quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateItemRequestDtoToJson(
  UpdateItemRequestDto instance,
) => <String, dynamic>{'estimated_quantity': instance.estimatedQuantity};
