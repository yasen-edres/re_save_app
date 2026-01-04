import 'package:re_save_app/domain/entities/response/profile/profile.dart';

import '../../model/profile_dto.dart';

extension ProfileDtoMapper on ProfileDto {
  Profile toProfile() {
    return Profile(
      id: id,
      name: name,
      email: email,
      phone: phone,
      emailVerifiedAt: emailVerifiedAt,
      points: points,
      level: level,
      createdAt: createdAt,
      updatedAt: updatedAt,
      role: role,
      image: image,
    );
  }
}
