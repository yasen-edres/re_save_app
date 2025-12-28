import 'package:re_save_app/api/model/response/change_password_response_dto.dart';

import '../../domain/entities/response/change_password_response.dart';

extension ChangePasswordResponseMappers on ChangePasswordResponseDto {
  ChangePasswordResponse toChangePasswordResponse() {
    return ChangePasswordResponse(message: message);
  }
}
