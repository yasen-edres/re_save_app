import 'package:json_annotation/json_annotation.dart';

part 'add_item_to_cart_request_dto.g.dart';

@JsonSerializable()
class AddItemToCartRequestDto {
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "estimated_quantity")
  final int? estimatedQuantity;
  @JsonKey(name: "image")
  final String? image;


  AddItemToCartRequestDto ({
    this.itemId,
    this.image,
    this.estimatedQuantity,
  });

  factory AddItemToCartRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddItemToCartRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddItemToCartRequestDtoToJson(this);
  }
}


