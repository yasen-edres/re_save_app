import 'package:json_annotation/json_annotation.dart';
import 'package:re_save_app/api/model/user_dto.dart';

part 'register_response_dto.g.dart';

@JsonSerializable()
class RegisterResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  RegisterResponseDto ({
    this.status,
    this.message,
    this.token,
    this.user,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterResponseDtoToJson(this);
  }
}




