import 'package:re_save_app/api/model/request/auth/login_request_dto.dart';
import 'package:re_save_app/domain/entities/request/auth/login_request.dart';
import 'package:re_save_app/domain/entities/request/auth/register_request.dart';

import '../../model/request/auth/register_request_dto.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(password: password, email: email);
  }
}

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequestDto() {
    return RegisterRequestDto(password: password, email: email, name: name);
  }
}
