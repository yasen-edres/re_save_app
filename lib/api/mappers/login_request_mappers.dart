import 'package:re_save_app/api/model/request/login_request_dto.dart';
import 'package:re_save_app/domain/entities/request/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(password: password, email: email);
  }
}
