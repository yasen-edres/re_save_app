import 'package:injectable/injectable.dart';
import 'package:re_save_app/domain/entities/request/register_request.dart';
import 'package:re_save_app/domain/entities/response/register_response.dart';

import '../repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<RegisterResponse> invoke(RegisterRequest request) {
    return repository.register(request);
  }
}
