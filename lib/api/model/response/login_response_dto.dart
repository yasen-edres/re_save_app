import 'package:json_annotation/json_annotation.dart';
import 'package:re_save_app/api/model/user_dto.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  LoginResponseDto({
    this.status,
    this.message,
    this.token,
    this.user,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseDtoToJson(this);
  }
}


