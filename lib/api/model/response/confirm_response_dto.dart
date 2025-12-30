import 'package:json_annotation/json_annotation.dart';

import '../confirm_order_dto.dart';

part 'confirm_response_dto.g.dart';

@JsonSerializable()
class ConfirmResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final ConfirmOrderDto? order;


  ConfirmResponseDto ({
    this.message,
    this.order,
  });

  factory ConfirmResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ConfirmResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmResponseDtoToJson(this);
  }
}






