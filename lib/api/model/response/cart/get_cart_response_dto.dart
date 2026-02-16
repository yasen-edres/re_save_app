import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response_dto.g.dart';

@JsonSerializable()
class GetCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "data")
  final DataDto? data;
  @JsonKey(name: "message")
  final String? message;


  GetCartResponseDto ({
    this.status,
    this.data,
    this.message,
  });

  factory GetCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartResponseDtoToJson(this);
  }
}

@JsonSerializable()
class DataDto {
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
  final String? totalQuantity;
  @JsonKey(name: "total_points")
  final int? totalPoints;
  @JsonKey(name: "scheduled_at")
  final dynamic? scheduledAt;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "items")
  final List<ItemsDto>? items;

  DataDto ({
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

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}

@JsonSerializable()
class ItemsDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "order_id")
  final int? orderId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "estimated_quantity")
  final String? estimatedQuantity;
  @JsonKey(name: "actual_quantity")
  final dynamic? actualQuantity;
  @JsonKey(name: "price")
  final String? price;
  @JsonKey(name: "points_earned")
  final int? pointsEarned;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "image")
  final dynamic? image;
  @JsonKey(name: "item")
  final ItemDto? item;

  ItemsDto ({
    this.id,
    this.orderId,
    this.itemId,
    this.estimatedQuantity,
    this.actualQuantity,
    this.price,
    this.pointsEarned,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.item,
  });

  factory ItemsDto.fromJson(Map<String, dynamic> json) {
    return _$ItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemsDtoToJson(this);
  }
}

@JsonSerializable()
class ItemDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "pricing_type")
  final String? pricingType;
  @JsonKey(name: "price")
  final String? price;
  @JsonKey(name: "is_active")
  final bool? isActive;
  @JsonKey(name: "created_at")
  final dynamic? createdAt;
  @JsonKey(name: "updated_at")
  final dynamic? updatedAt;
  @JsonKey(name: "category")
  final String? category;

  ItemDto ({
    this.id,
    this.name,
    this.description,
    this.image,
    this.pricingType,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return _$ItemDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemDtoToJson(this);
  }
}


