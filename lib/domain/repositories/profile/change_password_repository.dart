import 'package:re_save_app/domain/entities/request/profile/change_password_request.dart';
import 'package:re_save_app/domain/entities/response/profile/change_password_response.dart';

abstract class ChangePasswordRepository {
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
