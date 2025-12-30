import 'package:json_annotation/json_annotation.dart';

part 'cart_item_dto.g.dart';

@JsonSerializable()
class CartItemDto {
  @JsonKey(name: "order_id")
  final int? orderId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "estimated_quantity")
  final int? estimatedQuantity;
  @JsonKey(name: "price")
  final String? price;
  @JsonKey(name: "points_earned")
  final int? pointsEarned;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "id")
  final int? id;

  CartItemDto ({
    this.orderId,
    this.itemId,
    this.estimatedQuantity,
    this.price,
    this.pointsEarned,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return _$CartItemDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemDtoToJson(this);
  }
}