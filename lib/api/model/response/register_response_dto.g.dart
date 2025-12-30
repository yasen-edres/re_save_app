// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseDto _$RegisterResponseDtoFromJson(Map<String, dynamic> json) =>
    RegisterResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseDtoToJson(
  RegisterResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};
