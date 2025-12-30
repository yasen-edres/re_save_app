// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmResponseDto _$ConfirmResponseDtoFromJson(Map<String, dynamic> json) =>
    ConfirmResponseDto(
      message: json['message'] as String?,
      order: json['order'] == null
          ? null
          : ConfirmOrderDto.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfirmResponseDtoToJson(ConfirmResponseDto instance) =>
    <String, dynamic>{'message': instance.message, 'order': instance.order};
