import 'package:re_save_app/domain/entities/request/update_profile_request.dart';

import '../model/request/updata_profile_request_dto.dart';

extension UpdateProfileRequestMappers on UpdateProfileRequest {
  UpdateProfileRequestDto toUpdateProfileRequestDto() {
    return UpdateProfileRequestDto(phone: phone, image: image, name: name);
  }
}
