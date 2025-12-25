import 'package:json_annotation/json_annotation.dart';

import '../user_dto.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  LoginResponseDto({this.token, this.user});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseDtoToJson(this);
  }
}
