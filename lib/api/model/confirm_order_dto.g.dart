// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmOrderDto _$ConfirmOrderDtoFromJson(Map<String, dynamic> json) =>
    ConfirmOrderDto(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      riderId: json['rider_id'],
      status: json['status'] as String?,
      totalQuantity: (json['total_quantity'] as num?)?.toInt(),
      totalPoints: (json['total_points'] as num?)?.toInt(),
      scheduledAt: json['scheduled_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ConfirmItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfirmOrderDtoToJson(ConfirmOrderDto instance) =>
    <String, dynamic>{
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
