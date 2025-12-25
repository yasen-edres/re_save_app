import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/login_response.dart';

import '../../domain/entities/request/login_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<LoginResponse> login(LoginRequest request) {
    return authRemoteDataSource.login(request);
  }
}
