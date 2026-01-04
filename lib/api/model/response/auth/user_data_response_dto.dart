import 'package:json_annotation/json_annotation.dart';

part 'user_data_response_dto.g.dart';

@JsonSerializable()
class UserDataResponseDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final dynamic? phone;
  @JsonKey(name: "email_verified_at")
  final dynamic? emailVerifiedAt;
  @JsonKey(name: "points")
  final int? points;
  @JsonKey(name: "level")
  final String? level;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "image")
  final dynamic? image;

  UserDataResponseDto({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.points,
    this.level,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.image,
  });

  factory UserDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataResponseDtoToJson(this);
  }
}
