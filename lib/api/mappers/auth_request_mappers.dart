import 'package:re_save_app/api/model/request/login_request_dto.dart';
import 'package:re_save_app/domain/entities/request/login_request.dart';
import 'package:re_save_app/domain/entities/request/register_request.dart';

import '../model/request/register_request_dto.dart';

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
