import 'package:re_save_app/api/mappers/user_mappers.dart';
import 'package:re_save_app/core/exceptions/app_exception.dart';
import 'package:re_save_app/domain/entities/response/login_response.dart';

import '../model/response/login_response_dto.dart';

extension LoginResponseMappers on LoginResponseDto {
  LoginResponse toLoginResponse() {
    if (token != null || token!.isNotEmpty || user != null) {
      return LoginResponse(token: token, user: user?.toUser());
    } else {
      throw ServerException(errorMessage: 'failed authentication');
    }
  }
}
