import 'package:json_annotation/json_annotation.dart';

part 'confirm_request_dto.g.dart';

@JsonSerializable()
class ConfirmRequestDto {
  @JsonKey(name: "address")
  final String? address;

  ConfirmRequestDto ({
    this.address,
  });

  factory ConfirmRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ConfirmRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmRequestDtoToJson(this);
  }
}


