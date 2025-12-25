import '../../domain/entities/request/login_request.dart';
import '../../domain/entities/response/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}
