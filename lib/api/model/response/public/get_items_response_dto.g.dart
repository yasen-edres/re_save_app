// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemsResponseDto _$GetItemsResponseDtoFromJson(Map<String, dynamic> json) =>
    GetItemsResponseDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetItemsResponseDtoToJson(
  GetItemsResponseDto instance,
) => <String, dynamic>{'items': instance.items};
