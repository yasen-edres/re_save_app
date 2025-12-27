// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestDto _$UpdateProfileRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateProfileRequestDto(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$UpdateProfileRequestDtoToJson(
  UpdateProfileRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'image': instance.image,
};
