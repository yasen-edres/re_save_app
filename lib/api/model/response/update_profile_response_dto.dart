import 'package:json_annotation/json_annotation.dart';
import 'package:re_save_app/api/model/profile_dto.dart';

part 'update_profile_response_dto.g.dart';

@JsonSerializable()
class UpdateProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final ProfileDto? profile;

  UpdateProfileResponseDto({this.message, this.profile});

  factory UpdateProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateProfileResponseDtoToJson(this);
  }
}
