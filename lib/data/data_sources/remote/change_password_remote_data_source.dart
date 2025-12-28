import 'package:re_save_app/domain/entities/request/change_password_request.dart';
import 'package:re_save_app/domain/entities/response/change_password_response.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );
}
