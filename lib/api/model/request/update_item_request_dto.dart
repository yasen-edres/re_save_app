import 'package:json_annotation/json_annotation.dart';

part 'update_item_request_dto.g.dart';

@JsonSerializable()
class UpdateItemRequestDto {
  @JsonKey(name: "estimated_quantity")
  final int? estimatedQuantity;

  UpdateItemRequestDto ({
    this.estimatedQuantity,
  });

  factory UpdateItemRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateItemRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateItemRequestDtoToJson(this);
  }
}


