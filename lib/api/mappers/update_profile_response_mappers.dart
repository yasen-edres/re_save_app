import 'package:re_save_app/api/mappers/profile_dto_mappers.dart';
import 'package:re_save_app/api/model/response/update_profile_response_dto.dart';

import '../../domain/entities/response/update_profile_response.dart';

extension UpdateProfileResponseMappers on UpdateProfileResponseDto {
  UpdateProfileResponse toUpdateProfileResponse() {
    return UpdateProfileResponse(
      message: message,
      profile: profile?.toProfile(),
    );
  }
}
