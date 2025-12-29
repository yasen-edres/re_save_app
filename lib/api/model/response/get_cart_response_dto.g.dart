// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartResponseDto _$GetCartResponseDtoFromJson(Map<String, dynamic> json) =>
    GetCartResponseDto(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartResponseDtoToJson(GetCartResponseDto instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  address: json['address'],
  latitude: json['latitude'],
  longitude: json['longitude'],
  riderId: json['rider_id'],
  status: json['status'] as String?,
  totalQuantity: json['total_quantity'] as String?,
  totalPoints: (json['total_points'] as num?)?.toInt(),
  scheduledAt: json['scheduled_at'],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ItemsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'rider_id': instance.riderId,
  'status': instance.status,
  'total_quantity': instance.totalQuantity,
  'total_points': instance.totalPoints,
  'scheduled_at': instance.scheduledAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'items': instance.items,
};

ItemsDto _$ItemsDtoFromJson(Map<String, dynamic> json) => ItemsDto(
  id: (json['id'] as num?)?.toInt(),
  orderId: (json['order_id'] as num?)?.toInt(),
  itemId: (json['item_id'] as num?)?.toInt(),
  estimatedQuantity: json['estimated_quantity'] as String?,
  actualQuantity: json['actual_quantity'],
  price: json['price'] as String?,
  pointsEarned: (json['points_earned'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  image: json['image'],
  item: json['item'] == null
      ? null
      : ItemDto.fromJson(json['item'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemsDtoToJson(ItemsDto instance) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'item_id': instance.itemId,
  'estimated_quantity': instance.estimatedQuantity,
  'actual_quantity': instance.actualQuantity,
  'price': instance.price,
  'points_earned': instance.pointsEarned,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'image': instance.image,
  'item': instance.item,
};

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
