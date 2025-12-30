import 'package:json_annotation/json_annotation.dart';

part 'confirm_items_dto.g.dart';

@JsonSerializable()
class ConfirmItemsDto {
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

  ConfirmItemsDto ({
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

  factory ConfirmItemsDto.fromJson(Map<String, dynamic> json) {
    return _$ConfirmItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmItemsDtoToJson(this);
  }
}