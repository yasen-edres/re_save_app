// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'],
  image: json['image'] as String?,
  points: (json['points'] as num?)?.toInt(),
  level: json['level'] as String?,
  updatedAt: json['updated_at'] as String?,
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'image': instance.image,
  'points': instance.points,
  'level': instance.level,
  'updated_at': instance.updatedAt,
  'created_at': instance.createdAt,
  'id': instance.id,
};
