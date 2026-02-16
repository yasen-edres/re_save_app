import 'package:json_annotation/json_annotation.dart';

import '../../cart_item_dto.dart';

part 'add_item_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddItemToCartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final CartItemDto? cartItemDto;

  AddItemToCartResponseDto ({
    this.status,
    this.message,
    this.cartItemDto,
  });

  factory AddItemToCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddItemToCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddItemToCartResponseDtoToJson(this);
  }
}




