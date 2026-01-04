import 'package:json_annotation/json_annotation.dart';

part 'update_item_response_dto.g.dart';

@JsonSerializable()
class UpdateItemResponseDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "order_id")
  final int? orderId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "estimated_quantity")
  final int? estimatedQuantity;
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

  UpdateItemResponseDto ({
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
  });

  factory UpdateItemResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateItemResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateItemResponseDtoToJson(this);
  }
}


