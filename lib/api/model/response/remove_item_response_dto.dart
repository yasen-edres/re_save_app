import 'package:json_annotation/json_annotation.dart';

part 'remove_item_response_dto.g.dart';

@JsonSerializable()
class RemoveItemResponseDto {
  @JsonKey(name: "message")
  final String? message;

  RemoveItemResponseDto ({
    this.message,
  });

  factory RemoveItemResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RemoveItemResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RemoveItemResponseDtoToJson(this);
  }
}


