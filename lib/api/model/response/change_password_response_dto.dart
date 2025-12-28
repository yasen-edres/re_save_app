import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;

  ChangePasswordResponseDto({this.message});

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordResponseDtoToJson(this);
  }
}
