import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/response/user.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  RegisterResponseDto({this.message, this.token, this.user});

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseDtoToJson(this);
  }
}
