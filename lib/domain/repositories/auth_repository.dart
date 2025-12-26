import 'package:re_save_app/domain/entities/request/register_request.dart';
import 'package:re_save_app/domain/entities/response/login_response.dart';
import 'package:re_save_app/domain/entities/response/register_response.dart';

import '../entities/request/login_request.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);

  Future<RegisterResponse> register(RegisterRequest request);
}
