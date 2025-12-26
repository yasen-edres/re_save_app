// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponseDto _$UserDataResponseDtoFromJson(Map<String, dynamic> json) =>
    UserDataResponseDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'],
      emailVerifiedAt: json['email_verified_at'],
      points: (json['points'] as num?)?.toInt(),
      level: json['level'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      role: json['role'] as String?,
      image: json['image'],
    );

Map<String, dynamic> _$UserDataResponseDtoToJson(
  UserDataResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'email_verified_at': instance.emailVerifiedAt,
  'points': instance.points,
  'level': instance.level,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'role': instance.role,
  'image': instance.image,
};
