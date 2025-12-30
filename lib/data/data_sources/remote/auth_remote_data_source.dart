import 'package:re_save_app/domain/entities/request/register_request.dart';
import 'package:re_save_app/domain/entities/response/register_response.dart';

import '../../../domain/entities/request/login_request.dart';
import '../../../domain/entities/response/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);

  Future<RegisterResponse> register(RegisterRequest request);
}
