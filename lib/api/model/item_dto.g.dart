// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  pricingType: json['pricing_type'] as String?,
  price: json['price'] as String?,
  isActive: (json['is_active'] as num?)?.toInt(),
  createdAt: json['created_at'],
  updatedAt: json['updated_at'],
  category: json['category'] as String?,
);

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'pricing_type': instance.pricingType,
  'price': instance.price,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'category': instance.category,
};
