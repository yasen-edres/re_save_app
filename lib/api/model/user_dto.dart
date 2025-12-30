import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';
@JsonSerializable()
class UserDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final dynamic? phone;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "points")
  final int? points;
  @JsonKey(name: "level")
  final String? level;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "id")
  final int? id;

  UserDto ({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.level,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
}