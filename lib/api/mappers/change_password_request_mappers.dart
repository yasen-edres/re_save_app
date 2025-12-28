import 'package:re_save_app/api/model/request/change_password_request_dto.dart';
import 'package:re_save_app/domain/entities/request/change_password_request.dart';

extension ChangePasswordRequestMappers on ChangePasswordRequest {
  ChangePasswordRequestDto toChangePasswordRequestDto() {
    return ChangePasswordRequestDto(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
