import 'package:re_save_app/domain/entities/request/auth/register_request.dart';
import 'package:re_save_app/domain/entities/response/auth/register_response.dart';

import '../../../../domain/entities/request/auth/login_request.dart';
import '../../../../domain/entities/response/auth/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);

  Future<RegisterResponse> register(RegisterRequest request);
}
