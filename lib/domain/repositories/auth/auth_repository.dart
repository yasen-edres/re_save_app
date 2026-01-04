import 'package:re_save_app/domain/entities/request/auth/register_request.dart';
import 'package:re_save_app/domain/entities/response/auth/login_response.dart';
import 'package:re_save_app/domain/entities/response/auth/register_response.dart';

import '../../entities/request/auth/login_request.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);

  Future<RegisterResponse> register(RegisterRequest request);
}
