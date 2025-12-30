import 'package:json_annotation/json_annotation.dart';

import 'confirm_items_dto.dart';

part 'confirm_order_dto.g.dart';

@JsonSerializable()
class ConfirmOrderDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "address")
  final dynamic? address;
  @JsonKey(name: "latitude")
  final dynamic? latitude;
  @JsonKey(name: "longitude")
  final dynamic? longitude;
  @JsonKey(name: "rider_id")
  final dynamic? riderId;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "total_quantity")
  final int? totalQuantity;
  @JsonKey(name: "total_points")
  final int? totalPoints;
  @JsonKey(name: "scheduled_at")
  final String? scheduledAt;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "items")
  final List<ConfirmItemsDto>? items;

  ConfirmOrderDto ({
    this.id,
    this.userId,
    this.address,
    this.latitude,
    this.longitude,
    this.riderId,
    this.status,
    this.totalQuantity,
    this.totalPoints,
    this.scheduledAt,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory ConfirmOrderDto.fromJson(Map<String, dynamic> json) {
    return _$ConfirmOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmOrderDtoToJson(this);
  }
}