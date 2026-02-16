import 'package:re_save_app/api/model/response/auth/user_data_response_dto.dart';
import 'package:re_save_app/domain/entities/response/profile/user_data_response.dart';

extension UserResponseMappers on UserDataResponseDto {
  UserDataResponse toUserDataResponse() {
    return UserDataResponse(
      email: email,
      name: name,
      level: level,
      image: image,
      id: id,
      createdAt: createdAt,
      emailVerifiedAt: emailVerifiedAt,
      phone: phone,
      points: points,
      role: role,
      updatedAt: updatedAt,
    );
  }
}
