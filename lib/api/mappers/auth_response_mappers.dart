import 'package:re_save_app/api/mappers/user_mappers.dart';
import 'package:re_save_app/domain/entities/response/login_response.dart';

import '../../domain/entities/response/register_response.dart';
import '../model/response/login_response_dto.dart';
import '../model/response/register_response_dto.dart';

extension LoginResponseMappers on LoginResponseDto {
  LoginResponse toLoginResponse() {
    return LoginResponse(
      token: token,
      user: user?.toUser(),
      message: message,
      status: status,
    );
  }
}
extension RegisterResponseMappers on RegisterResponseDto {
  RegisterResponse toRegisterResponse() {
    return RegisterResponse(
      user: user?.toUser(),
      token: token,
      message: message,
      status: status,
    );
  }
}
