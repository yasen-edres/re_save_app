import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/response/auth/login_response.dart';

import '../../entities/request/auth/login_request.dart';
import '../../repositories/auth/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<LoginResponse> invoke(LoginRequest request) {
    return repository.login(request);
  }
}
