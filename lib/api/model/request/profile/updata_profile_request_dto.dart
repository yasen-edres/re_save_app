import 'package:json_annotation/json_annotation.dart';

part 'updata_profile_request_dto.g.dart';

@JsonSerializable()
class UpdateProfileRequestDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "image")
  final String? image;

  UpdateProfileRequestDto({this.name, this.phone, this.image});

  factory UpdateProfileRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateProfileRequestDtoToJson(this);
  }
}
