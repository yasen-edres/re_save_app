import 'package:json_annotation/json_annotation.dart';

import '../item_dto.dart';

part 'get_items_response_dto.g.dart';

@JsonSerializable()
class GetItemsResponseDto {
  @JsonKey(name: "items")
  final List<ItemDto>? items;

  GetItemsResponseDto({this.items});

  factory GetItemsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetItemsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetItemsResponseDtoToJson(this);
  }
}
