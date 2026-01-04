import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/auth/register_request.dart';
import 'package:re_save_app/domain/entities/response/auth/login_response.dart';
import 'package:re_save_app/domain/entities/response/auth/register_response.dart';

import '../../../domain/entities/request/auth/login_request.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../data_sources/remote/auth/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<LoginResponse> login(LoginRequest request) {
    return authRemoteDataSource.login(request);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return authRemoteDataSource.register(request);
  }
}
